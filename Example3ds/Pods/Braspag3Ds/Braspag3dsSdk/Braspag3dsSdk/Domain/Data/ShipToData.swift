//
//  ShipToData.swift
//  Braspag3dsSdk
//
//  Created by Jeferson Nazario on 20/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

public class ShipToData: Encodable {
    var sameAsBillTo: Bool?
    var addresssee: String?
    var phoneNumber: Int?
    var email: String?
    var street1: String?
    var street2: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var country: String?
    var shippingMethod: ShippingMethod?
    var firstUsageDate: String?
    
    public init(sameAsToBill: Bool?,
                addresssee: String? = nil,
                phoneNumber: Int? = nil,
                email: String? = nil,
                street1: String? = nil,
                street2: String? = nil,
                city: String? = nil,
                state: String? = nil,
                zipCode: String? = nil,
                country: String? = nil,
                shippingMethod: ShippingMethod? = nil,
                firstUsageDate: String? = nil) {
        
        self.sameAsBillTo = sameAsToBill
        self.addresssee = addresssee
        self.phoneNumber = phoneNumber
        self.email = email
        self.street1 = street1
        self.street2 = street2
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.country = country
        self.shippingMethod = shippingMethod
        self.firstUsageDate = firstUsageDate
    }
}
