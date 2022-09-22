//
//  UserAuthService.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation
import UIKit

typealias UserDataModel = activeCodeModel
class UserAuthService {

    private init () { }

    private let userDataKey = "_User_|_Data_"
    private let packageExpireKey = "packageExpireKey"
    private static let userDefault = UserDefaults.standard

    fileprivate func getUserData() -> activeCodeModel? {
        let defaults = UserDefaults.standard
        guard let savedPerson = defaults.object(forKey: userDataKey) as? Data,
              let loadedData = try? JSONDecoder().decode(UserDataModel.self, from: savedPerson)
        else { return nil }
        return loadedData
    }

    fileprivate func setUserData(_ newValue: activeCodeModel?) {
        // guard let newValue = newValue else { return }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(newValue) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: userDataKey)
        } else {
            fatalError("Unable To Save User Data")
        }
    }

    static var userData: UserDataModel? {
        get {
            let authService = UserAuthService()
            return authService.getUserData()
        } set {
            let authService = UserAuthService()
            authService.setUserData(newValue)
        }
    }

}
