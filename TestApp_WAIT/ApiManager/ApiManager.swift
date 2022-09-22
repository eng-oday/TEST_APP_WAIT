//
//  ApiManager.swift
//  TestApp_WAIT
//
//  Created by Oday Dieg on 21/09/2022.
//

import Foundation
import UIKit
import Alamofire


struct Upload_file {
    var ext : String
    var file_data : Data
    var mimeType : String
}

class ApiManager : UIViewController {
    
    var lang : String = "ar"
    static let instance = ApiManager()
    
    
        
    //MARK: - Default Request
    func getPosts<T : Decodable>(methodType: HTTPMethod = .post , parameters:[String:AnyObject]?, url : String , Completion : @escaping (T? ,String?)->Void){
        
        

        var headers: HTTPHeaders? = nil
        
        if UserAuthService.userData?.api_token  != "" && UserAuthService.userData?.api_token   != nil {
            headers = [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(UserAuthService.userData?.api_token  ?? "")" ,
                "Accept-Language": lang

            ]
        }else{
            headers = [
                "Content-Type": "application/json",
                "Accept-Language": lang
            ]
        }
        
        print(headers!)
        
        let net             = NetworkReachabilityManager()
        net?.startListening()
        // internet connection is on
        net?.listener =
        { status in
            
            if  net?.isReachable ?? false
            {
                let encodedLink         = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
                let encodedURL          = NSURL(string: encodedLink!)! as URL
                
                Alamofire.request(
                    encodedURL,
                    method: methodType,
                    parameters: parameters,
                    encoding: JSONEncoding.default,
                    headers: headers).responseJSON
                {
                    response in
                    
                    debugPrint("---------->" , url ,response.response?.statusCode , response.response , response.result.isSuccess , response.result , encodedURL)
                    
                    // response get success
                    if response.result.isSuccess {
                        print("this is response debug description ------------------\(response.debugDescription)")
                        
                        let dict = response.result.value! as! [String:Any]
                        print(dict)
                        
                        if dict["code"] as? Int == 200  {
  
                            guard let data = response.data else {
                                return
                            }
                            print(data)
                            do {
                                let Posts = try JSONDecoder().decode(T.self, from: data)
                                print(Posts)
                                Completion(Posts, nil)

                            }catch let error {
                                Completion(nil , error.localizedDescription)
                                print("----------->>>>>>>>>>>>>>>" ,error , "----------->>>>>>>>>>>>>>>>>>")
                            }
                        }
                            
                            else{
                                if dict["code"] as? Int  == 401 || dict["code"] as? Int  == 481 {
                                    UserAuthService.userData = nil
                                    self.unlock()
                                    Helper.restartApp()
                                    //return
                                }
                                print(dict["errorMessage"])
                                if let dictError = dict["errorMessage"] as? String {
                                    Completion(nil , dictError)
                                }
                        }
                    }else {
                            //response get failed
                            print(response.response?.statusCode)
                            Completion(nil,"anError")
                        }
                }
            }
                
            // no internet Connection
            else {
                Completion(nil,"noNet")
            }

        }

    }
    //MARK: - MultiPart Request
    func uploadImage<T : Decodable>(methodType: HTTPMethod = .post , parameters: [String: AnyObject]? = nil , url : String , imagesArray: [UIImage]? = nil , Files_array : [Upload_file]? = nil, profileImage: UIImage? = nil , Transfere_image: UIImage? = nil,From_offer:Bool = false ,store_logo: UIImage? = nil,store_cover:UIImage? = nil, Completion : @escaping (T? ,String?)->Void) {
        
        var headers: HTTPHeaders? = nil

        if UserAuthService.userData?.api_token != "" && UserAuthService.userData?.api_token  != nil {
            headers = [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(UserAuthService.userData?.api_token ?? "")" ,
            ]
        }else{
            headers = [
                "Content-Type": "application/json",
            ]
        }
        
        print(url)
        print(headers)
        let URL = try! URLRequest(url: url, method: .post, headers: headers)
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                
                                if(profileImage != nil ){
                                    if  let profileImageData = profileImage?.compressToAndReturnData(0.08) {
                                 //   guard let profiledata = profileImage else{return}
                                    
                                        multipartFormData.append(profileImageData , withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
                
                                }
                                }
                
                for (key, value) in parameters! {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                
            },
            with: URL,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let request, _, _):
                    print("success")
                    request.uploadProgress(closure: { (progress_) in
                        print("Upload Progress: \(progress_.fractionCompleted)")
                        print("Upload totalUnitCount: \(progress_.totalUnitCount)")
                    })
                    request.validate(statusCode: 200..<500)
                    
                    print(request.response?.statusCode)
                    request.responseJSON { response in
                        
                        debugPrint("uploadRegistration: \(response)")
                        if response.result.isSuccess {
                            request.uploadProgress(closure: { (progress_) in
                                print("Upload Progress: \(progress_.fractionCompleted)")
                                print("Upload totalUnitCount: \(progress_.totalUnitCount)")
                            })
                            let dict = response.result.value! as! Dictionary<String, Any>
                            
                            print(response.result)
                            print(response)
                            
                            if (dict["code"] as? Int != 200){
                                
                                if let code = dict["code"] as? String {
                                    if code == "401" {
                                        UserAuthService.userData = nil
                                        self.view.isUserInteractionEnabled = true
                                        Helper.restartApp()
                                        return
                                    }
                                }
                                let errorMsg = dict["errorMessage"] as? String
                                Completion(nil , errorMsg)
                                
                            }else{
                                let statusCode = response.response?.statusCode
                                if dict["data"] as? [String:Any] != nil {
                                    print(response)
                                    guard let data = response.data else {
                                        return
                                    }
                                    do {
                                        let Posts = try JSONDecoder().decode(T.self, from: data)
                                        Completion(Posts, nil)
                                    }catch let error {
                                        
                                        Completion(nil , error.localizedDescription)
                                        print(error)
                                        
                                    }
                                    
                                }else{
                                    Completion(nil , "Something Went Wrong.")
                                }
                                
                            }
                        }else { //FAILURE
                            print("error \(String(describing: response.result.error)) in serviceName: Upload Image")
                            print(response.response?.statusCode)
                            Completion(nil, response.result.error?.localizedDescription)
                        }
                        
                    }
                case .failure(let errorType):
                    print("encodingError:\(errorType)")
                    Completion(nil , errorType.localizedDescription)
                }

            })
        
    }
    
    
}


