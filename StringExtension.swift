//
//  StringExtension.swift
//  DriveFindMyCab
//
//  Created by Amarnath B on 30/05/17.
//  Copyright © 2017 Sun Telematics Pvt Ltd. All rights reserved.

//

import UIKit

extension String {
    
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.characters.count
    }
    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "TRUE", "yes", "Yes", "YES", "1":
            return true
        case "False", "false", "FALSE", "no", "No", "NO", "0":
            return false
        default:
            return nil
        }
    }
    
    func isValidEmail() -> Bool {
        // //print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidMobileNumber() -> Bool {
        let PHONE_REGEX = "[0-9]{10}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    func isValidInput() -> Bool {
        let RegEx = "[\\b([A-Za-z]{4,})([0-9._# $%+-@]{0,})]{4,}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self)
    }
    func DateFromTimeStamp() -> String {
        let epocTime = TimeInterval(Int(self)!) / 1000
        
        let myDate = NSDate(timeIntervalSince1970:  epocTime)   // "Apr 16, 2015, 2:40 AM"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        
        let dateObj = dateFormatter.string(from: myDate as Date)
        
        return dateObj
    }
}
