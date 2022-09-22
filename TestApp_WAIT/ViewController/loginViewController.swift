//
//  loginViewController.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import UIKit

class loginViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var textFieldContainerView: UIView!
    @IBOutlet weak var mobileOrEmailTextField: UITextField!
    @IBOutlet weak var gotToRegisterButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    let mobileID = UIDevice.current.identifierForVendor?.uuidString

    enum mobileType:Int {
        case iphone     = 2
        case android    = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupViewController()
        listenToKeyboard()
    }
    
    private func listenToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
    }
    
    private func setupViewController(){
        
        textFieldContainerView.layer.cornerRadius       = 8
        loginButton.layer.cornerRadius                  = 8
        mobileOrEmailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginButton.alpha     = 0.5
        loginButton.isEnabled = false
        mobileOrEmailTextField.attributedPlaceholder    = NSAttributedString(
            string: "username",
            attributes: [
            NSAttributedString.Key.foregroundColor:
            UIColor(
                        displayP3Red: 44/250,
                        green: 54/250,
                        blue: 65/250,
                        alpha: 0.2)]
        )
        mobileOrEmailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         self.dismissKeyboard()
         return false
     }
    
    @objc func textFieldDidChange(){
        
        let email           = mobileOrEmailTextField.text ?? ""
        
        if email != ""  {
            loginButton.alpha     = 1
            loginButton.isEnabled = true
        }else{
            loginButton.alpha     = 0.5
            loginButton.isEnabled = false
        }
    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if mobileOrEmailTextField.text != "" {
            
            Login(phone: mobileOrEmailTextField.text ?? "", device_type: mobileType.iphone.rawValue, device_id: mobileID ?? "")
            
        }else {
            self.showAlertWithTitle(title: "", message: errorMessage.emptyEmailField, type: .error)
        }
    }
    
    
    @IBAction func goToResgisterButtonPressed(_ sender: Any) {
        guard let vc = UIStoryboard.init(name: storyBoard.Main, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.registerViewController) as? registerViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

extension loginViewController {
    
    private func Login(phone:String,device_type:Int , device_id:String)
    {
        let param = [
            "phone": phone,
            "device_type": device_type,
            "device_id":device_id
        ] as! [String:AnyObject]

        self.lock()
        ApiManager.instance.getPosts(methodType: .post, parameters: param, url: ServiceURl.login) { [weak self]
            (Model: loginAndRegisterModel? , err : String? )in

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
                            // go to active Code Screen
                            guard let vc = UIStoryboard.init(name: storyBoard.Main, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.activiationViewController) as? activiationViewController else {return}
                            vc.phoneNumber  = phone ?? ""
                            vc.activateCode = String(model.data?.sms_code ?? 0)
                            print(model.data?.sms_code ?? 0)
                    self.navigationController?.pushViewController(vc, animated: true)
                            

    }

        }

}
    
}
