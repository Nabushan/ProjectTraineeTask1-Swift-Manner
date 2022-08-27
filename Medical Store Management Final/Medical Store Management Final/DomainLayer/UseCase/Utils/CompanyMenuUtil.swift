//
//  CompanyMenuUtil.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class CompanyMenuUtil: CategoryUtil {
    weak var companyMenuDelegate: CompanyProtocol?
    weak var goBackDelegate: GoBackProtocol?
    
    override func didSelectFunctionalityOption(_ choice: Int){
        let opted = CompanyFunctionality(rawValue: choice)
        switch(opted){
        case .add:
            let company = companyMenuDelegate?.readCompanyDetail()
            company?.addCompany()

        case .update:
            companyMenuDelegate?.showUpdateOptions()

        case .display:
            companyMenuDelegate?.showDisplayOptions()

        case .remove:
            companyMenuDelegate?.displayAllCompanies()
            
            guard let companyName = companyMenuDelegate?.getInfoToRemove(toShow: "Company"),companyName.count != 0 else {
                print("Company name to remove is empty.")
                return
            }
            
            self.removeCompany(companyName)

        case .back:
            goBackDelegate?.goBack()
            return
            
        default:
            print(defaultMessage)
            return
        }
        companyMenuDelegate?.showMenu(role: LoggedInUser.user.role)
    }
    
    override func didSelectUpdate(_ choice: Int) {
        guard let opted = CompanyUpdateField(rawValue: choice) else {
            print("Failed to update.")
            return
        }
        
        category = "Company"
        
        let optedMessage = opted.message
        
        companyMenuDelegate?.displayAllCompanies()
        
        guard let updateContainer = companyMenuDelegate?.readUpdateDetailWith(categoryInputMessage: commonUpdateMessage,fieldInputMessage: "Enter the new" + optedMessage) else {
            print("Failed to Update.")
            return
        }
        
        let company: Company? = getCompany(companyName: updateContainer.name)
        
        company?.updateCompany(with: opted,valueToBeUpdated: updateContainer.updateVal)
    }

    
    override func didSelectDisplay(_ choice: Int){
        
        let opted = CompanyDisplayFunctionality(rawValue: choice)
        switch(opted){
        case .allCompanies:
            companyMenuDelegate?.displayAllCompanies()
            
        case .byName:
            companyMenuDelegate?.displayCompany()
            
        case .nameWithId:
            companyMenuDelegate?.displayCompanyNamesWithId()
            
        default:
            print(defaultMessage)
        }
    }
    
    func getCompany(companyName name: String) -> Company? {
        let companies = Storage.sharedInstance.getAllCompanies()
        for company in companies {
            if(company.name == name){
                return company
            }
        }
        return nil
    }
    
    func removeCompany(_ name: String){
        if(name.count == 0){
            print("Removal Failed due to empty String.")
        }
        
        let companies = Storage.sharedInstance.getAllCompanies()
        
        for index in 0..<companies.count {
            if(companies[index].name == name){
                Storage.sharedInstance.removeCompany(atIndex: index)
                return
            }
        }
        
        print("Removal Failed, since value entered is not available.")
    }
}
