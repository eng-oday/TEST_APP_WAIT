//
//  ViewController + Ext.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation
import SVProgressHUD
import NVActivityIndicatorView
import AJMessage
import CoreImage
import UIKit

extension UIViewController{

    enum Vibration {
        case error
        case success
        func vibrate() {
            switch self {
            case .error:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
                
            case .success:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                
            }
    }
    }

    func showAlertWithTitle(title: String, message: String, type: Vibration) {
        
        if type == .error {
            AJMessage(title: title, message: message , status : .error ).show()
            
          //  self.navigationController?.view.makeToast(message)
            
        }else if type == .success {
            AJMessage(title: title, message: message , status : .success).show()
           // self.navigationController?.view.makeToast(message , position: .top)
        }
        
    }
    
    func lock(frameRect: CGRect = CGRect.zero) {
        let activityIndicatorView = NVActivityIndicatorView(frame: .init(x: 0, y: 0, width: 50, height: 50), type: .ballClipRotateMultiple, color: UIColor.systemBlue, padding: .zero)
        view.addSubview(activityIndicatorView)
        view.isUserInteractionEnabled = false
        activityIndicatorView.center = self.view.center
        activityIndicatorView.startAnimating()
       
    }
    
    func unlock() {
        DispatchQueue.main.async {
            if let indicator = self.view.subviews.first(where: {$0 is NVActivityIndicatorView }) as? NVActivityIndicatorView {
                indicator.stopAnimating()
                self.view.isUserInteractionEnabled = true
                indicator.removeFromSuperview()
            }
        }
    }
    
    
    @objc func keyboardWillShowInLogin(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - (keyboardSize.height - 95)
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - (keyboardSize.height - 20)
            }
        }
        view.frame.origin.y = view.frame.origin.y - 200
    }


    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

        func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    

}
