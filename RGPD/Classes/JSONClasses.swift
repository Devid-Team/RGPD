//
//  JSONClasses.swift
//  RGPD
//
//  Created by Thibault Deprez on 23/05/2018.
//  Copyright © 2018 Thibault Deprez. All rights reserved.
//

import Foundation

struct pageTexts : Decodable {
    var CGU : String?
    var CGV : String?
    var private_data : String?
    var stats: String?
    var comm : String?
    var payment_data : String?
}

struct appliConfigAnswer : Decodable {
    var success : Bool
    var error : String?
    var config : pageTexts?
}

struct addUserAnswer : Decodable {
    var success : Bool
    var error : String?
}

struct applicationAuthorization : Decodable {
    var vendorId : String
    var keyAccepted : [String]
    var applicationBundleId : String
}

struct authorizationAnswer : Decodable {
    var success : Bool
    var error : String?
    var auth : applicationAuthorization?
}

struct RGPDStylePage : Decodable {
    var pageName : String
    var titleColor : [String]
    var iconColor : [String]
    var checkColor : [String]
    var fullCircleColor : [String]
    var emptyCircleColor : [String]
    var fullButtonColor : [String]
    var emptyButtonColor : [String]
    var fullButtonTextColor : [String]
    var emptyButtonTextColor : [String]
    var textColor : [String]
    var backButtonColor : [String]
    var backgroundColor : [String]
}

struct RGPDStyleFile :Decodable {
    var name : String
    var pages : [RGPDStylePage]
}
