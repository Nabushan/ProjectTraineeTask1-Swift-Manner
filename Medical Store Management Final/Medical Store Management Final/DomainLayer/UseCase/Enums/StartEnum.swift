//
//  StartEnum.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

enum StartFunctionality: Int, CaseIterable, MenuRequirmentProtocol {
    case logIn = 1
    case signUp
    
    
    var menuItem: String {
        switch(self){
        case .logIn:  return "Log In"
        case .signUp: return "Sign Up"
        }
    }
}
