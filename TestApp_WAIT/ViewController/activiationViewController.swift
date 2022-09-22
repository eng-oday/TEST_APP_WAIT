//
//  activiationViewController.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import UIKit

class activiationViewController: UIViewController {

    
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var codeNumberPad: UITextField!
    @IBOutlet weak var activateCodeBtn: UIButton!
    @IBOutlet weak var resendCodeBtn: UIButton!
    
    var phoneNumber     = ""
    var activateCode    = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConrtoller()
        
    }
    
    private func setupViewConrtoller() {
        activateCodeBtn.layer.cornerRadius      = 8
        phoneTextField.isEnabled                = false
        phoneTextField.text                     = phoneNumber
        
    }
    
    @IBAction func resendCodeBtnPRessed(_ sender: Any) {
        // call service to resend it again
        resendCode(phone: phoneTextField.text ?? "")
    }
    
    @IBAction func activateCodeBtnPRessed(_ sender: Any) {
        // call service to active code
        if codeNumberPad.text != ""{
            activate(phone: phoneTextField.text ?? "", code: codeNumberPad.text ?? "")

        }else
        {
            self.showAlertWithTitle(title: "", message: "please enter code ", type: .error)
        }
     
    }
    

}


extension activiationViewController {
    
    private func activate(phone:String,code:String)
    {
        let param = [
            "phone": phone,
            "code": code,
        ] as! [String:AnyObject]

        self.lock()
        ApiManager.instance.getPosts(methodType: .post, parameters: param, url: ServiceURl.avtivateCode) { [weak self]
            (Model: activeCodeModel? , err : String? )in

            guard let self = self else {return}
            self.unlock()
                        if  err != nil {

                            //  Completion(nil,"noNet")
                            if err == "noNet" {
                                // self.show_NoDataView(View: self.view)
                                print("----------------->No net")

                            }else if err == "anError" {
                                //  self.show_AnErrorView(View: self.view)
                                print("an errrrorrrrrrrrrrrr")
                            }else {
                                self.showAlertWithTitle(title: "", message: err ?? "", type: .error)
                            }

                        }else {
                            guard let model = Model else{return}
                            self.showAlertWithTitle(title: "", message:model.successMessage ?? "", type: .success)
                            //Save user To user Default
                            UserAuthService.userData = model
                            
                            // go to active Code Screen
                            guard let vc = UIStoryboard.init(name: storyBoard.Main, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.mapViewController) as? mapViewController else {return}
                            self.navigationController?.pushViewController(vc, animated: true)

    }

        }

}
    
    private func resendCode(phone:String)
    {
        let param = [
            "phone": phone,
        ] as! [String:AnyObject]
        self.lock()

        ApiManager.instance.getPosts(methodType: .post, parameters: param, url: ServiceURl.resendCode) { [weak self]
            (Model: resendCodeModel? , err : String? )in

            guard let self = self else {return}
            self.unlock()
                        if  err != nil {

                            //  Completion(nil,"noNet")
                            if err == "noNet" {
                                // self.show_NoDataView(View: self.view)
                                print("----------------->No net")

                            }else if err == "anError" {
                                //  self.show_AnErrorView(View: self.view)
                                print("an errrrorrrrrrrrrrrr")
                            }else {
                                self.showAlertWithTitle(title: "", message: err ?? "", type: .error)
                            }

                        }else {
                            guard let model = Model else{return}
                            self.showAlertWithTitle(title: "", message:"\(model.data?.sms_code ?? 0)", type: .success)
                            // go to active Code Screen

    }

        }

}


    
    
}
