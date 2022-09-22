//
//  constants.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation



enum storyBoard {
    static let Main                             = "Main"
}

enum ViewControllers {
    static let loginViewController              = "loginViewController"
    static let registerViewController           = "registerViewController"
    static let activiationViewController        = "activiationViewController"
    static let mapViewController                = "mapViewController"
    static let splashAnimateVc                  = "splashAnimateVc"
    
}

enum NavigationController {
    static let rootNavigation       = "rootNavigation"
}


enum ServiceURl {
    static let avtivateCode         = "https://waiteg.com/task/api/huNfLJI3TCs8qfwH9/clients/activeCode"
    static let resendCode           = "https://waiteg.com/task/api/huNfLJI3TCs8qfwH9/clients/resendCode"
    static let rsgister             = "https://waiteg.com/task/api/huNfLJI3TCs8qfwH9/clients/register"
    static let login                = "https://waiteg.com/task/api/huNfLJI3TCs8qfwH9/clients/login"
}

enum errorMessage {
    static let emptyEmailField      = "من فضلك قم بإدخال رقم الجوال او الإيميل "
}
