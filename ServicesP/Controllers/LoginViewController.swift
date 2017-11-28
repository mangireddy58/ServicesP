//
//  LoginViewController.swift
//  ServicesP
//
//  Created by Rushikesh Kulkarni on 23/11/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ClassForServerCommDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTxtFld.delegate = self
        passwordTxtFld.delegate = self
        userNameTxtFld.keyboardType = .emailAddress
        
    }
    @IBAction func submitAction(_ sender: Any) {
        
        // using NSUrlSession
        let loginParams = String(format:Constants.Service_Parameters.LOGIN_PARAMS,self.userNameTxtFld.text!,self.passwordTxtFld.text!,"31232312312313123")
        let serverCommObj = ServerCommunication()
        serverCommObj.delegate = self
        print("",loginParams)
        serverCommObj.sendPostParametersWithNSUrlSession(parameterString: loginParams, serviceName: Constants.Service_Names.Login_Service_URL)
        
        // using AFNetworking
//        serverCommObj.sendHttpPostRequestWithAFNetworking(parametersString: loginParams, serviceName: Constants.Service_Names.Login_Service_URL)
        
        // using Alamofire
//        let userDetails : NSDictionary = [
//            "Email" : self.userNameTxtFld.text!,
//            "Password" : self.passwordTxtFld.text!,
//           "IMEI" : "1131313131313131313131"]
//        serverCommObj.sendHttpPostRequestWithAlamoFire(params: userDetails, serviceName: Constants.Service_Names.Login_Service_URL)
    }
    
    func onServiceSuccess(responseDictionary : NSDictionary) {
        print(responseDictionary)
        let message = responseDictionary[Constants.Response_Params.response_status] as! String
        if message == Constants.Response_Params.response_fail {
            print(responseDictionary[Constants.Response_Params.response_msg] as! String)
        }
        else {
            let loginResArray = (responseDictionary["data"] as! NSArray)
            print("Skills array\(loginResArray)")
        }
    }
    
    func onServiceFailed() {
        print("Service failed")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
