//
//  StartMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class StartMenu: MenuProtocol {
    let optionFailure = "Failed to fetch choice."
    let messageEmpty = "Empty value passed for "

    let startMenuUtil: StartMenuUtil = StartMenuUtil()
    
    init(){
        startMenuUtil.startMenuDelegate = self
    }
    
    func showMenu() {
        print(getAllOptionsFor(StartFunctionality.self))
        guard let choice = readInt() else {
            return
        }
        
        startMenuUtil.didChoseCategory(choice)
    }
}
