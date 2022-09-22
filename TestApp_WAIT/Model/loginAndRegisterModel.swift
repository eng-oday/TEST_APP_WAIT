//
//  loginModel.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation

struct loginAndRegisterModel : Codable {
    let data : Dataa?
    let status : Bool?
    let code : Int?
    let successMessage : String?
    let errorMessage : String?
    let validationMessage : String?
    let api_token : String?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
        case status = "status"
        case code = "code"
        case successMessage = "successMessage"
        case errorMessage = "errorMessage"
        case validationMessage = "validationMessage"
        case api_token = "api_token"
    }
}
struct Dataa : Codable {
    let sms_code : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case sms_code = "sms_code"
    }
}
