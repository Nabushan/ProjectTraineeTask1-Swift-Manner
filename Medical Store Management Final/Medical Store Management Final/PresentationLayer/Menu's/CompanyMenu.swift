//
//  CompanyMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class CompanyMenu: CategoryMenu, CompanyProtocol {
    let companyMenuUtil: CompanyMenuUtil
    
    override init(category: MenuRequirmentProtocol & StoreInchargeAccessProtocol){
        companyMenuUtil = CompanyMenuUtil()
        super.init(category: category)
        categoryUtil = companyMenuUtil
        companyMenuUtil.companyMenuDelegate = self
    }
    
    func showMenu(role: Role) {
        guard var option = showMenuFor(role: role) else {
            return
        }
        
        option = getEquivalentOption(role, option, enumType: CompanyFunctionality.self)
        
        companyMenuUtil.didSelectFunctionalityOption(option)
    }
    
    func showUpdateOptions() {
        showUpdateMenu(for: CompanyUpdateField.self)
    }
    
    func showDisplayOptions(){
        showDisplayMenu(for: CompanyDisplayFunctionality.self)
    }
    
    func displayAllCompanies(){
        displayAllDetails(for: .company)
    }
    
    override func getAllItems() -> [EntityRequirment] {
        return Storage.sharedInstance.getAllCompanies()
    }
    
    func displayCompany(){
        print("Enter the name of company to display : ")
        guard let name = readString()else {
            return
        }
        
        let companies = Storage.sharedInstance.getAllCompanies()
        
        companies.forEach{ company in
            if(company.name == name){
                print(company.description)
            }
        }
    }
    
    func displayCompanyNamesWithId() {
        let companies = Storage.sharedInstance.getAllCompanies()
        
        for index in 0..<companies.count {
            print("""
                  [Company Id = \(index)
                  Company Name = \(companies[index].name)]
                  
                  """)
        }
    }
    
    func readCompanyDetail() -> Company? {
        print("Enter the name of the Company : ")
        guard let companyName = readString()else {
            return nil
        }
        
        print("Enter the Medicine manufactured by the Company : ")
        guard let medicineName = readString() else {
            return nil
        }
        
        print("Enter the location of the Company : ")
        guard let companyLocation = readString() else {
            return nil
        }
        
        let company = Company(name: companyName, medicineManufactured: medicineName, companyLocation: companyLocation)
        return company
    }
    
    func getInfoToRemove(toShow show: String) -> String? {
        return getInformationToRemove(toShow: show)
    }
    
    func readUpdateDetailWith(categoryInputMessage catMessage: String, fieldInputMessage fieldMess: String) -> UpdateInfo? {
        return readDetailsForUpdate(printMessage: catMessage, UpdateFieldMessage: fieldMess)
    }
}
