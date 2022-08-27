//
//  LogInENum.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

enum Role {
    case admin
    case storeIncharge
}

enum LogInAs: Int, CaseIterable, MenuRequirmentProtocol {
    case admin = 1
    case StoreIncharge
    case toGoBack
    
    var menuItem: String {
        switch(self){
        case .admin: return "Admin"
        case .StoreIncharge: return "Store Incharge"
        case .toGoBack: return "To Quit"
        }
    }
}
