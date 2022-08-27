//
//  StartMenuUtil.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class StartMenuUtil {
    weak var startMenuDelegate: MenuProtocol?
    var userMenu: UserMenu 
    
    init(){
        userMenu = UserMenu()
        userMenu.userAccessMenuUtil.goBackDelegate = self
    }
    
    func didChoseCategory(_ choice: Int) {
        let opted = StartFunctionality(rawValue: choice)
        switch(opted){
        case .logIn:
            userMenu.showMenu()
            
        case .signUp:
            ()
            /*Sign Up has not been taken into cosideration, this will be handled during app creation.*/
            
        default:
            print(defaultMessage)
        }
    }
}

extension StartMenuUtil: GoBackProtocol {
    func goBack(){
        startMenuDelegate?.showMenu()
    }
}
