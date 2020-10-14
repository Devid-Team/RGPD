//
//  RGPD.swift
//  RGPD
//
//  Created by Thibault Deprez on 23/05/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import Foundation

public enum RGPDPages : String {
    case cgu = "CGU"
    case cgv = "CGV"
    case stats = "stats"
    case private_data = "private_data"
    case comm = "comm"
    case payment_data = "payment_data"
}

public class RGPD {
    private static let instance = RGPD()
    internal var pagesShown = [RGPDPages]()
    internal var pagesAccepted = [RGPDPages]()
    internal var theme : RGPDStyleFile!
    internal var applicationBundleId : String!
    internal var authGiven : applicationAuthorization!
    internal var texts : pageTexts!
    private var isInit = false
    
    private let semaphore = DispatchSemaphore(value: 1)
    
    init() {
        if let path = Bundle(for: RGPD.self).path(forResource: "document", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                self.theme = try decoder.decode(RGPDStyleFile.self, from: data)
            } catch {
                // handle error
            }
        }
    }
    
    public class var shared : RGPD {
        return instance
    }
    
    public func setTheme(themeData : Data) {
        do {
            let decoder = JSONDecoder()
            let themeTmp = try decoder.decode(RGPDStyleFile.self, from: themeData)
            if themeTmp.pages.count == 8 {
//                var array = ["welcome" : false , "CGU" : false, "CGV" : false, "stats" : false, "private_data" : false, "comm" : false, "payment_data" : false, "account" : false]
//                for item in array {
//                    for page in themeTmp.pages {
//                        if item.key == page.pageName {
//                            item[page.pageName] = true
//                            break
//                        }
//                    }
//                }
//                if !array.contains(where: {$0.value == false}) {
                    self.theme = themeTmp
//                }
            }
        } catch {
            print(error)
            // handle error
        }
    }
    
    public func configure(applicationBundleId: String) {
        if (self.applicationBundleId == nil) {
            self.applicationBundleId = applicationBundleId
        }
    }
    
    func retrieveConfigAndAuthFromServer() {
        self.semaphore.wait()
        pagesAccepted = [RGPDPages]()
        Webservice.getConfig(completion: { data in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let tmp = try decoder.decode(appliConfigAnswer.self, from: data)
                self.texts = tmp.config
                self.isInit = tmp.success && tmp.config != nil
            } catch {
                print(error)
                return
                // handle error
            }
            Webservice.getUserAuthorizations(completion: { data in
                guard let data = data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let tmp = try decoder.decode(authorizationAnswer.self, from: data)
                    self.authGiven = tmp.auth
                } catch {
                    print(error)
                    // handle error
                }
                self.semaphore.signal()
            })
        })
    }
    
    public func hasAllAuthorizations(completionHandler : @escaping(Bool) -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.retrieveConfigAndAuthFromServer()
            self.semaphore.wait()
            if !self.isInit {
                completionHandler(false)
                return
            }
            self.pagesShown.removeAll()
            if self.authGiven != nil {
                if self.texts.CGU != nil && !self.authGiven.keyAccepted.contains(RGPDPages.cgu.rawValue) {
                    self.pagesShown.append(.cgu)
                }
                if self.texts.CGV != nil && !self.authGiven.keyAccepted.contains(RGPDPages.cgv.rawValue) {
                    self.pagesShown.append(.cgv)
                }
                if self.texts.private_data != nil && !self.authGiven.keyAccepted.contains(RGPDPages.private_data.rawValue) {
                    self.pagesShown.append(.private_data)
                }
                if self.texts.stats != nil && !self.authGiven.keyAccepted.contains(RGPDPages.stats.rawValue) {
                    self.pagesShown.append(.stats)
                }
                if self.texts.comm != nil && !self.authGiven.keyAccepted.contains(RGPDPages.comm.rawValue) {
                    self.pagesShown.append(.comm)
                }
                if self.texts.payment_data != nil && !self.authGiven.keyAccepted.contains(RGPDPages.payment_data.rawValue) {
                    self.pagesShown.append(.payment_data)
                }
            } else {
                if self.texts.CGU != nil {
                    self.pagesShown.append(.cgu)
                }
                if self.texts.CGV != nil {
                    self.pagesShown.append(.cgv)
                }
                if self.texts.private_data != nil {
                    self.pagesShown.append(.private_data)
                }
                if self.texts.stats != nil {
                    self.pagesShown.append(.stats)
                }
                if self.texts.comm != nil {
                    self.pagesShown.append(.comm)
                }
                if self.texts.payment_data != nil {
                    self.pagesShown.append(.payment_data)
                }
                print(self.pagesShown)
            }
            self.semaphore.signal()
            completionHandler(self.pagesShown.count == 0)
        }
    }
    
    public func showRGPDModally(_ viewController : UIViewController) {
        if isInit {
            let storyboard = UIStoryboard(name: "main", bundle: Bundle(for: RGPD.self))
            let controller = storyboard.instantiateViewController(withIdentifier: "begin")
            controller.modalPresentationStyle = .fullScreen
            viewController.present(controller, animated: true, completion: nil)
        }
    }
    
    public func showAccountModally(_ viewController : UIViewController, completion : @escaping (Bool) -> Void) {
        if isInit {
            let storyboard = UIStoryboard(name: "Account", bundle: Bundle(for: RGPD.self))
            let controller = storyboard.instantiateViewController(withIdentifier: "account") as! AccountVC
            controller.modalPresentationStyle = .fullScreen
            controller.completion = completion
            viewController.present(controller, animated: true, completion: nil)
        }
    }
}
