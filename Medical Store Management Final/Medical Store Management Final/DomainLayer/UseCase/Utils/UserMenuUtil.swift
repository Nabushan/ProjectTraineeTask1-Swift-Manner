//
//  UserMenuUtil.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class UserMenuUtil {
    weak var userMenuDelegate: UserProtocol?
    weak var goBackDelegate: GoBackProtocol?
    let mainMenu: MainMenu
    
    init(){
        mainMenu = MainMenu()
        mainMenu.mainMenuUtil.goBackDelegate = self
    }
    
    func didChoseCategory(_ choice: Int) {
        let opted = LogInAs(rawValue: choice)
        switch(opted){
        case .admin:
            
            guard let admin = userMenuDelegate?.validateUser() else {
                print("LogIn Failed.")
                userMenuDelegate?.showMenu()
                return
            }
            
            LoggedInUser.user = admin
            mainMenu.showMenu()
            
            
        case .StoreIncharge:
            mainMenu.showMenu()
            /* Validation for Store Incharge will be included during App Development. */
            
        case .toGoBack:
            goBackDelegate?.goBack()
            return
            
        default:
            print(defaultMessage)
        }
    }
}

extension UserMenuUtil: GoBackProtocol {
    func goBack(){
        userMenuDelegate?.showMenu()
    }
}
