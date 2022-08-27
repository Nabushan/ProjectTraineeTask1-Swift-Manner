//
//  MainMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class MainMenu: MenuProtocol {
    let mainMenuUtil: MainMenuUtil
    
    init(){
        mainMenuUtil = MainMenuUtil()
        mainMenuUtil.mainMenuDelegate = self
    }
    
    func showMenu() {
        print(getAllOptionsFor(AvailableCategory.self))
        guard let choice = readInt() else {
            return
        }
        
        mainMenuUtil.didChoseCategory(choice)
    }
}
