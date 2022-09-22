//
//  activeCodeModel.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation


struct activeCodeModel : Codable {
    let data : activeData?
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

    struct activeData : Codable {
        let user : User?
        
        enum CodingKeys: String, CodingKey {
            
            case user = "user"
        }
    }

struct User : Codable {
    let id : Int?
    let name : String?
    let phone : String?
    let email : String?
    let admin : Int?
    let status : Int?
    let image : String?
    let active : Int?
    let country_code : String?
    let neighborhood_id : Int?
    let city_id : Int?
    let radius : String?
    let lang : String?
    let login_count : Int?
    let isActive : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case phone = "phone"
        case email = "email"
        case admin = "admin"
        case status = "status"
        case image = "image"
        case active = "active"
        case country_code = "country_code"
        case neighborhood_id = "neighborhood_id"
        case city_id = "city_id"
        case radius = "radius"
        case lang = "lang"
        case login_count = "login_count"
        case isActive = "isActive"
    }
}
