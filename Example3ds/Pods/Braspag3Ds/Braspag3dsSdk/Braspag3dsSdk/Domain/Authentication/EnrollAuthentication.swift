//
//  EnrollAuthentication.swift
//  CardinalPoc
//
//  Created by Jeferson Nazario on 12/09/19.
//  Copyright © 2019 jnazario.com. All rights reserved.
//

class EnrollAuthentication: Codable {
    var directoryServerTransactionId: String?
    var xid: String?
    var eci: String?
    var eciRaw: String?
    var cavv: String?
    var paresStatus: String?
    var authenticationResult: String?
    var authenticationStatusMessage: String?
    var version: String?
    var status: AuthenticationStatus?
    var returnCode: String
    var returnMessage: String
    
    init(directoryServerTransactionId: String? = nil,
         xId: String? = nil,
         eci: String? = nil,
         eciRaw: String? = nil,
         cavv: String? = nil,
         paresStatus: String? = nil,
         authenticationResult: String? = nil,
         authenticationStatusMessage: String? = nil,
         version: String? = nil,
         status: AuthenticationStatus? = nil,
         returnCode: String,
         returnMessage: String) {
        
        self.directoryServerTransactionId = directoryServerTransactionId
        self.xid = xId
        self.eci = eci
        self.eciRaw = eciRaw
        self.cavv = cavv
        self.paresStatus = paresStatus
        self.authenticationResult = authenticationResult
        self.authenticationStatusMessage = authenticationStatusMessage
        self.version = version
        self.status = status
        self.returnCode = returnCode
        self.returnMessage = returnMessage
    }
    
    func toAuthResponse() -> AuthenticationResponse {
        return AuthenticationResponse(cavv: self.cavv,
                                      xId: self.xid,
                                      eci: self.eci,
                                      version: self.version,
                                      referenceId: self.directoryServerTransactionId,
                                      returnCode: self.returnCode,
                                      returnMessage: self.returnMessage)
    }
}
