//
//  Helper.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation
import UIKit

class Helper: NSObject {
    // IsFirst
    
    class func isFirst()->String {

        let api_token = "isFirst"
        return api_token
    }

    class func SaveisFirst(token : String?){
        let def = UserDefaults.standard
        def.setValue(token, forKey: isFirst())
        def.synchronize()
    }

    class func getisFirst()->String? {
        let def = UserDefaults.standard
        return def.object(forKey: isFirst()) as? String
    }


    // IsFirst

    class func isStart_screen()->String {
        let api_token = "isStart_screen"
        return api_token
    }

    class func SaveisStart_screen(token : String?){
        let def = UserDefaults.standard
        def.setValue(token, forKey: isStart_screen())
        def.synchronize()
    }

    class func getisStart_screen()->String? {
        let def = UserDefaults.standard
        return def.object(forKey: isStart_screen()) as? String
    }

    // IsFirst

    class func isComplete_Register()->String {

        let api_token = "isComplete_Register"
        return api_token
    }

    class func SaveisComplete_Register(token : String?){
        let def = UserDefaults.standard
        def.setValue(token, forKey: isComplete_Register())
        def.synchronize()
    }

    class func getisComplete_Register()->String? {
        let def = UserDefaults.standard
        return def.object(forKey: isComplete_Register()) as? String
    }



    class func Fcm_toket()->String {
        let Fcm_token = "Fcmtoken"
        return Fcm_token
    }

    class func SaveFcmtoken(Fcmtoken : String?){
        let def = UserDefaults.standard
        def.setValue(Fcmtoken, forKey: Fcm_toket())
        def.synchronize()
    }

    class func getFcmtoken()->String? {
        let def = UserDefaults.standard
        return def.object(forKey: Fcm_toket()) as? String
    }


    class func restartApp(){
        if UserAuthService.userData?.api_token != nil {
//                // MARK: go To home
                guard let window = UIApplication.shared.keyWindow else{return}
                    let sb = UIStoryboard(name: storyBoard.Main, bundle: nil)
                    var vc : UIViewController
            vc = sb.instantiateViewController(withIdentifier: ViewControllers.mapViewController)
                    window.rootViewController = vc
                    UIView.transition(with: window, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
        }else {
            // MARK: go To Start Screen
            guard let window = UIApplication.shared.keyWindow else{return}
           let sb = UIStoryboard(name: storyBoard.Main, bundle: nil)
             var vc : UIViewController
            vc = sb.instantiateViewController(withIdentifier: NavigationController.rootNavigation)
             window.rootViewController = vc
           UIView.transition(with: window, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
        }

    }
    
//    class func restartToLogin(){
//
//           // MARK: go To home
//            guard let window = UIApplication.shared.keyWindow else{return}
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            var vc : UIViewController
//            vc = sb.instantiateViewController(withIdentifier: "StartScreenVC")
//            window.rootViewController = vc
//            UIView.transition(with: window, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
//
//    }

}
