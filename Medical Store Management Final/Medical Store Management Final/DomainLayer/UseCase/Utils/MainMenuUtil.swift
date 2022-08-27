//
//  MainMenuUtil.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class MainMenuUtil {
    weak var mainMenuDelegate: MenuProtocol?
    weak var goBackDelegate: GoBackProtocol?
    
    lazy var medicineMenu: MedicineMenu = {
        let menu = MedicineMenu(category: MedicineFunctionality.add)
        menu.medicineMenuUtil.goBackDelegate = self
        
        return menu
    }()
    
    lazy var salesRecordMenu: SalesRecordMenu = {
        let menu = SalesRecordMenu(category: SalesRecordFunctionality.add)
        menu.salesRecordMenuUtil.goBackDelegate = self
        
        return menu
    }()
    
    lazy var companyMenu: CompanyMenu = {
        let menu = CompanyMenu(category: CompanyFunctionality.add)
        menu.companyMenuUtil.goBackDelegate = self
        
        return menu
    }()
    
    func didChoseCategory(_ choice: Int){
        let opted = AvailableCategory(rawValue: choice)
        if(opted == nil){
            print("Failed to choose Category.")
            return
        }
        
        switch(LoggedInUser.user.role){
        case .admin:
            switch(opted){
            case .medicine:
                medicineMenu.showMenu(role: LoggedInUser.user.role)
        
            case .company:
                companyMenu.showMenu(role: LoggedInUser.user.role)
            
            case .salesRecord:
                salesRecordMenu.showMenu(role: LoggedInUser.user.role)
                
            case .back:
                LoggedInUser.user = User()
                goBackDelegate?.goBack()
                return
                
            default:
                print(defaultMessage)
                return
            }
        
        case .storeIncharge:
            switch(opted){
            case .medicine:
                medicineMenu.showMenu(role: LoggedInUser.user.role)
                
            case .company:
                companyMenu.showMenu(role: LoggedInUser.user.role)
                
            case .salesRecord:
                salesRecordMenu.showMenu(role: LoggedInUser.user.role)
                
            case .back:
                goBackDelegate?.goBack()
                return
            
            default:
                print(defaultMessage)
                return
            }
        }
    }
}

extension MainMenuUtil: GoBackProtocol {
    func goBack() {
        mainMenuDelegate?.showMenu()
    }
}
