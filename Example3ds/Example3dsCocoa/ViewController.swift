//
//  ViewController.swift
//  Example
//
//  Created by Jeferson Nazario on 01/04/20.
//  Copyright © 2020 jnazario.com. All rights reserved.
//

import UIKit
import Braspag3Ds

class ViewController: UIViewController {
    
    @IBOutlet weak var btnStart: UIButton!

    var sdk: Braspag3dsProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnStart.addTarget(self, action: #selector(startSdkProcess), for: .touchUpInside)
    }
    
    //swiftlint:disable:next function_body_length
    @objc func startSdkProcess() {
                getAccessToken { (result) in
                    guard let accessToken = result else { return }
                    
                    self.sdk = Braspag3ds(accessToken: accessToken, environment: .production)
                    
//                    let order = OrderData(orderNumber: "123456",
//                                          currencyCode: "986",
//                                          totalAmount: 100,
//                                          paymentMethod: .credit,
//                                          transactionId: nil,
//                                          installments: 0,
//                                          recurrence: false,
//                                          productCode: .services,
//                                          countLast24Hours: nil,
//                                          countLast6Months: nil,
//                                          countLast1Year: nil,
//                                          cardAttemptsLast24Hours: nil,
//                                          marketingOptIn: nil,
//                                          marketingSource: nil,
//                                          transactionMode: .mobile,
//                                          merchantUrl: nil)
//
//                    let card = CardData(number: "5292050201136679",
//                                        expirationMonth: "11",
//                                        expirationYear: "22")
                    
                    let options = OptionsData()
                    
//                    self.sdk.authenticate(orderData: order,
//                                     cardData: card,
//                                     authOptions: options,
//                                     billToData: nil,
//                                     shipToData: nil,
//                                     cart: nil,
//                                     deviceData: nil,
//                                     userData: nil,
//                                     airlineData: nil,
//                                     mdd: nil,
//                                     recurringData: nil,
//                                     deviceIpAddress: nil) { (status, authentication, error) in
//
//                                        print(status)
//                                        print("Authentication: \(authentication?.debugJsonPrint() ?? "nil")")
//                                        print("Deu erro: \(error ?? "não")")
//                        switch status {
//                        case .success:
//                            break
//                        case .unenrolled:
//                            break
//                        case .unsupportedBrand:
//                            break
//                        case .failure:
//                            break
//                        case .error:
//                            break
//                        }
//                    }
                    
                    let order = OrderData(orderNumber: "123456",
                                          currencyCode: "986",
                                          totalAmount: 1000,
                                          paymentMethod: .debit,
                                          transactionId: nil,
                                          installments: 1,
                                          recurrence: false,
                                          productCode: .goodsPurchase,
                                          countLast24Hours: nil,
                                          countLast6Months: nil,
                                          countLast1Year: nil,
                                          cardAttemptsLast24Hours: nil,
                                          marketingOptIn: nil,
                                          marketingSource: nil,
                                          transactionMode: .mobile,
                                          merchantUrl: nil)
                    let card = CardData(number: "5502095345009957", expirationMonth: "06", expirationYear: "2028")
                    let billData = BillToData(contactName: "jose", phoneNumber: 999999999, email: "teste@gmsil.com", street1: "rua sei la", street2: "rua se la 2", city: "são paulo", state: "sp", zipCode: "00000000")

                    let cartItemData = CartItemData(name: "teste", description: "teste", sku: "3244234", quantity: 1, price: 1)
                    
                    self.sdk.authenticate(orderData: order,
                                         cardData: card,
                                         authOptions: options,
                                         billToData: billData,
                                         shipToData: nil,
                                         cart: [cartItemData],
                                         deviceData: nil,
                                         userData: nil,
                                         airlineData: nil,
                                         mdd: nil,
                                         recurringData: nil,
                                         deviceIpAddress: nil) { (status, authentication, error) in
    
                                            print(status)
                                            print("Authentication: \(authentication?.debugJsonPrint() ?? "nil")")
                                            print("Deu erro: \(error ?? "não")")
                            switch status {
                            case .success:
                                break
                            case .unenrolled:
                                break
                            case .unsupportedBrand:
                                break
                            case .failure:
                                break
                            case .error:
                                break
                            }
                        }
                }
    }
    
    func getAccessToken(completion: @escaping (String?) -> Void) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        guard let urlRequest: URL = URL(string: "https://mpi.braspag.com.br/v2/auth/token") else {
            completion(nil)
            return
        }
        var request: URLRequest = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["EstablishmentCode": "1114772094",
        "MerchantName": "NA ORLA TECNOLOGIA LTDA",
        "MCC": "7392"]
        
        guard let postData = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            completion(nil)
            return
        }
        
        request.httpBody = postData as Data
        
        // Sandbox
        let token = "MjMzMGVkNmYtMTlmMy00ZDI5LTk1MjYtYzQ1MTZkNjBmYTZhOlF5bldGWGp6UWNmM2JlaW1SZ2JDM2lnaHNnZVFsMGRZZEFDRVo4N05adzg9" //swiftlint:disable:this line_length
        
        request.setValue("Basic \(token)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request, completionHandler: { (result, _, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            guard let data = result else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decodableData: ResponseOauthToken = try decoder.decode(ResponseOauthToken.self, from: data)
                debugPrint("AccessToken: \(decodableData.accessToken ?? "FALHOU")")
                
                DispatchQueue.main.async {
                    completion(decodableData.accessToken)
                }
            } catch let exception {
                debugPrint(exception.localizedDescription)
                completion(nil)
            }
        })
        
        task.resume()
    }
}

extension Encodable {
    func debugJsonPrint() -> String {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(self) else { return "" }
        
        return String(data: jsonData, encoding: String.Encoding.utf8) ?? ""
    }
}
