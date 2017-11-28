//
//  Constants.swift
//  ServicesP
//
//  Created by Rushikesh Kulkarni on 22/11/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class Constants: NSObject {
    var kServiceUrlTag:Int = 100
    
    struct BASE_URLS {
        //Dev
        static let BASE_URL = "http://54.169.243.5:8080/MASService.svc/"
        //Prod
//        static let BASE_URL = "http://54.169.243.5/MASService.svc/"
    }
    struct Service_Names {
        static let Login_Service_URL = "AuthenticateEmployee"
    }
    
    struct Service_Parameters {
        static let LOGIN_PARAMS = "{\"Email\":\"%@\",\"Password\":\"%@\",\"IMEI\":\"%@\"}"
    }
    
    //MARK:- Service url tags
    enum kSERVICE_URL_TAG: Int {
        case login_url_tag = 100 //,url_tag,
        
    }
    
    struct Response_Params {
        static let response_status = "Response"
        static let response_msg = "ResponseMsg"
        static let response_fail = "Fail"
    }
    
    struct serviceTimeOut {
        static var service_Time_Out:Double = 30
    }
    
}
