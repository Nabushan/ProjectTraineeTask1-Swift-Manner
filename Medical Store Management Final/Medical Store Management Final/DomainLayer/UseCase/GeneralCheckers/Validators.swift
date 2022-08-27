//
//  Validators.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class Validator {
    enum DateError: Error {
        case AlreadyExpired
        case UnformattedDate
        case IllegalDate
        case IllegalMonth
    }
    
    static func isDateValid(_ date: String) throws {
        if(date.count < 10){
            throw DateError.UnformattedDate
        }
        
        let yearRange = date.index(date.startIndex, offsetBy: 0)...date.index(date.startIndex, offsetBy: 3)
        let year = String(date[yearRange])
        
        let monthRange = date.index(date.startIndex, offsetBy: 5)...date.index(date.startIndex, offsetBy: 6)
        let month = String(date[monthRange])
        
        let dateRange = date.index(date.startIndex, offsetBy: 8)...date.index(date.startIndex, offsetBy: 9)
        let date = (date[dateRange])
        
        
        
        guard let yearInt = Int(year) else {
            print("Failed to fetch year.")
            throw DateError.UnformattedDate
        }
        guard let monthInt = Int(month) else {
            print("Failed to fetch month.")
            throw DateError.UnformattedDate
        }

        guard let dateInt = Int(date) else {
            print("Failed to fetch date.")
            throw DateError.UnformattedDate
        }
        
        if(yearInt < 2022) {
            throw DateError.AlreadyExpired
        }
        
        if(monthInt < 1 || monthInt > 12) {
            throw DateError.IllegalMonth
        }
        if(dateInt < 1 || dateInt > 31) {
            throw DateError.IllegalDate
        }
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        let regexRequirment = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[0-9]).{6,}$"
        
        let range = NSRange(location: 0, length: password.utf16.count)
        let regex = try? NSRegularExpression(pattern: regexRequirment)
        let match = regex?.firstMatch(in: password,options: [], range: range)
        
        return match != nil
    }
    
    static func isMobileNumberValid(_ number: String) -> Bool {
        let regexPattern = "[0-9]{10}"
        let range = NSRange(location: 0, length: number.utf16.count)
        let regex = try? NSRegularExpression(pattern: regexPattern)
        let match = regex?.firstMatch(in: number, options: [], range: range)
        
        return match != nil
    }
}
