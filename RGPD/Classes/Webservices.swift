//
//  Webservices.swift
//  RGPD
//
//  Created by Thibault Deprez on 18/06/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import Foundation
import Alamofire

class Webservice {
    static func getUserAuthorizations(completion : @escaping(Data?) -> Void) {
        let url = URL(string: Config.baseURL + Config.userAuthorizationURL + "?bundleId=\(RGPD.shared.applicationBundleId!)&phoneId=\(UIDevice.current.identifierForVendor!)")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
            guard response.result.isSuccess else {
                print("POD RGPD Error : \(response)")
                completion(nil)
                return
            }
            completion(response.data)
        }
    }
    
    static func getConfig(completion : @escaping(Data?) -> Void) {
        let url = URL(string: Config.baseURL + Config.appliConfigURL + "?bundleId=\(RGPD.shared.applicationBundleId!)")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
            guard response.result.isSuccess else {
                print("POD RGPD Error : \(response)")
                completion(nil)
                return
            }
            completion(response.data)
        }
    }
    
    static func updateUserAuthorizations(authKeysString : String, completion : @escaping(Data?) -> Void) {
        let params : [String : String] = ["bundleId" : RGPD.shared.applicationBundleId!,
                      "phoneId": "\(UIDevice.current.identifierForVendor!)",
                      "auth" : authKeysString]
        
        let url = URL(string: Config.baseURL + Config.userAuthorizationURL)!
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate(statusCode: 200...400).responseJSON { response in
            guard response.result.isSuccess else {
                print("POD RGPD Error : \(response)")
                completion(nil)
                return
            }
            completion(response.data)
        }
    }
    
    static func deleteAuth(completion : @escaping(Data?) -> Void) {
        let params : [String : String] = ["bundleId" : RGPD.shared.applicationBundleId!,
                                          "phoneId": "\(UIDevice.current.identifierForVendor!)"]
        
        let url = URL(string: Config.baseURL + Config.deleteAuthURL)!
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate(statusCode: 200...400).responseJSON { response in
            guard response.result.isSuccess else {
                print("POD RGPD Error : \(response)")
                completion(nil)
                return
            }
            completion(response.data)
        }
    }
}
