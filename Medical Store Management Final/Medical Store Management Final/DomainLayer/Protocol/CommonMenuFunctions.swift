//
//  CommonMenuFunctions.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

protocol GoBackProtocol: AnyObject {
    func goBack()
}

protocol MenuProtocol: AnyObject {
    func showMenu()
}

protocol UserMenuProtocol: AnyObject {
    func validateUser() -> Admin?
}

protocol UserProtocol: MenuProtocol & UserMenuProtocol {}

protocol HelperProtocol: AnyObject {
    func showUpdateOptions()
    func showDisplayOptions()
    func getInfoToRemove(toShow show: String) -> String?
    func readUpdateDetailWith(categoryInputMessage: String, fieldInputMessage: String) -> UpdateInfo?
}

protocol MedicineMenuProtocol: HelperProtocol {
    func displayAllMedicines()
    func displayMedicine()
    func showMenu(role: Role)
    func readMedicineDetail() -> Medicine?
}

protocol SalesRecordMenuProtocol: HelperProtocol {
    func displayAllSalesRecords()
    func displaySalesRecordByName()
    func displaySalesRecordById()
    func displaySalesRecordByNameAndNumber()
    func showMenu(role: Role)
    func readCustomerDetail() -> Customer?
    func readSalesRecordDetail() -> SalesRecord?
}

protocol CompanyMenuProtocol: HelperProtocol {
    func displayAllCompanies()
    func displayCompany()
    func displayCompanyNamesWithId()
    func showMenu(role: Role)
    func readCompanyDetail() -> Company?
}

protocol CategoryMenuProtocol: AnyObject {
    func showMenuFor(role: Role) -> Int?
    func showUpdateMenu<T: MenuRequirmentProtocol & CaseIterable & RawRepresentable>(for item: T.Type)
    func showDisplayMenu<T: MenuRequirmentProtocol & CaseIterable & RawRepresentable>(for item: T.Type)
    func displayAllDetails(for category: AvailableCategory)
}

protocol MedicineProtocol:  MedicineMenuProtocol {}
protocol SalesRecordProtocol:  SalesRecordMenuProtocol {}
protocol CompanyProtocol: CompanyMenuProtocol {}
