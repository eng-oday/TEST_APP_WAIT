//
//  SceneDelegate.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if UserAuthService.userData?.api_token != nil {
//                // MARK: go To home
                    let sb = UIStoryboard(name: storyBoard.Main, bundle: nil)
                    var vc : UIViewController
            vc = sb.instantiateViewController(withIdentifier: ViewControllers.mapViewController)
                    window?.rootViewController = vc
                    UIView.transition(with: window!, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
        }else {
            // MARK: go To Start Screen
           let sb = UIStoryboard(name: storyBoard.Main, bundle: nil)
             var vc : UIViewController
            vc = sb.instantiateViewController(withIdentifier: ViewControllers.splashAnimateVc)
             window?.rootViewController = vc
            UIView.transition(with: window!, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
        }

   if Helper.getisFirst() == nil {
   Helper.SaveisFirst(token: "true")
   Helper.SaveisStart_screen(token: "true")
       
       
}
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

