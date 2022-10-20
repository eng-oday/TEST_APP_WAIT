//
//  registerViewController.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import UIKit

class registerViewController: UIViewController {
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var chooseImageBtn: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var neighborhoodTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var deviceId: UITextField!
    @IBOutlet weak var deviceTypeTextField: UITextField!
    @IBOutlet weak var keyboardHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollVew: UIScrollView!
    
    //new comment for test
    
    var flagForImage                    = false
    var falgTocallService               = true
    let mobileID                        = UIDevice.current.identifierForVendor?.uuidString
    var allTextField:[UITextField]      = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTextField()
        listenForKeyboardNotification()
    }
    
    
    private func setupTextField(){
        allTextField = [nameTextField,mobileTextField,emailTextField,cityTextField,neighborhoodTextField,deviceId,deviceTypeTextField]
        for textField in allTextField {
            textField.delegate = self
        }
    }
    
    
    
    private func setupViewController(){
        imageContainerView.layer.cornerRadius       = imageContainerView.frame.width / 2
        imageContainerView.layer.masksToBounds      = true
        imageContainerView.clipsToBounds            = true
        registerBtn.layer.cornerRadius              = 8
        deviceId.text                               = mobileID
        deviceId.isEnabled                          = false
    }
    
    private func listenForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShoww), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidee), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillHidee(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollVew.contentInset = contentInsets
        scrollVew.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillShoww(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
        scrollVew.contentInset = contentInsets
        scrollVew.scrollIndicatorInsets = contentInsets
    }
    

    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func chooseImageBtnPressed(_ sender: Any) {
        ImagePickerManager().pickImage(self){ [weak self] image in
            guard let self = self else {return}
            self.flagForImage = true
            self.userImage.image = image
        }
    }
    
    
    @IBAction func registerBtnPRessed(_ sender: UIButton){
            
        for textField in allTextField{
            if textField.text != "" {
                falgTocallService = true
            }else {
                falgTocallService = false
            }
        }
            
            if falgTocallService == true && flagForImage == true{
                register(name: nameTextField.text ?? "", device_type: deviceTypeTextField.text ?? "" , device_id: deviceId.text ?? "", phone: mobileTextField.text ?? "", email: emailTextField.text ?? "", city_id: cityTextField.text ?? "", neighborhood_id: neighborhoodTextField.text ?? "")
                
            }else if flagForImage == false{
                self.showAlertWithTitle(title: "", message: "profile image is required . ", type: .error)
                
            }else {
                self.showAlertWithTitle(title: "", message: "please fill all fields . ", type: .error)
                
            }
            
            
            
        }
    }





extension registerViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.dismissKeyboard()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let text = textField.text ?? ""
        
        if textField == nameTextField{
            if text.count <= 191 && text.count > 0{
            }else{
                if text == ""{
                }else{
                    self.showAlertWithTitle(title: "", message: "phone number must greater than 9  and less than 11", type: .error)
                    
                }
            }
        }
            
            
            
            if textField == mobileTextField{
                if text.isValidPhoneNumber(pattern: text) {
                }else{
                    if text == ""{
                    }else{
                        self.showAlertWithTitle(title: "", message: "phone number must greater than 9  and less than 11", type: .error)
                    }
                    
                }
            }
            if textField == emailTextField {
                if text.isValidEmail(){
                }else{
                    if text == ""{
                    }else{
                        self.showAlertWithTitle(title: "", message: "please enter Valid Email format", type: .error)
                        
                    }
                    
                    
                }
            }
            
            
            if textField == deviceId{
                if text.count >= 1 && text.count <= 191 {
                }else{
                    if text == ""{
                    }else{
                        self.showAlertWithTitle(title: "", message: "please enter device id in range from 1 to 191", type: .error)
                    }
                    
                    
                }
            }
            
            if textField == deviceTypeTextField {
                if text == "1" || text == "2" {
                }else{
                    if text == ""{
                    }else{
                        self.showAlertWithTitle(title: "", message: "please enter device type 1 or 2", type: .error)
                    }
                    
                }
            }
            
            if textField == cityTextField || textField == neighborhoodTextField {
                
                if text.isInt == true && text.count >= 1{
                }else{
                    if text == ""{
                    }else{
                        self.showAlertWithTitle(title: "", message: "please enter city id and neighborhood it must number ", type: .error)
                    }
                    
                }
            }
            
        }
        
    }

    
    extension registerViewController {
        
        
        func register (name:String,device_type:String , device_id:String,phone:String, email:String ,city_id:String ,neighborhood_id:String  )
        {
            
            
            let param = [
                "name": name,
                "device_type": device_type,
                "device_id": device_id,
                "phone": phone,
                "email" :email,
                "city_id": city_id,
                "neighborhood_id":neighborhood_id
            ] as! [String:AnyObject]
            self.lock()
            ApiManager.instance.uploadImage(methodType: .post, parameters: param, url: ServiceURl.rsgister, imagesArray: nil, Files_array: nil, profileImage: userImage.image, Transfere_image: nil, store_logo: nil, store_cover: nil) {[weak self](Model: loginAndRegisterModel? , err : String? )in
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
                    self.showAlertWithTitle(title: "", message: model.successMessage ?? "", type: .success)

                    guard let vc = UIStoryboard.init(name: storyBoard.Main, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.activiationViewController) as? activiationViewController else {return}
                            vc.phoneNumber  = phone ?? ""
                            vc.activateCode = String(model.data?.sms_code ?? 0)
                            print(model.data?.sms_code ?? 0)
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    
                }
            }
            
            
        }
        
        
        
    }
