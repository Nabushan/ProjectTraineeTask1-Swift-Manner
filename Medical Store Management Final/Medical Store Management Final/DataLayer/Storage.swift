//
//  Storage.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

import Foundation

class Storage {
    private var admins: [Admin]
    private var storeIncharges: [StoreIncharge]
    private var medicines: [Medicine]
    private var companies: [Company]
    private var categories: [Category]
    private var customers: [Customer]
    private var salesRecords: [SalesRecord]
 
    static var sharedInstance = Storage()
    
    private init() {
        admins = []
        medicines = []
        companies = []
        categories = []
        customers = []
        salesRecords = []
        storeIncharges = []
    }
    
    func reset() {
        Storage.sharedInstance = Storage()
    }
    
    func addAdmin(_ admin: Admin) {
        admins.append(admin)
    }
    
    func getAllAdmins() -> [Admin] {
        return admins
    }
    
    func isAdminPresent(_ name: String) -> Bool {
        return admins.contains{ admin -> Bool in
            return admin.name == name
        }
    }
    
    func getAdmin(from name: String) -> Admin? {
        for admin in admins{
            if(name == admin.name){
                return admin
            }
        }
        return nil
    }
    
    func addStoreIncharge(_ storeIncharge: StoreIncharge) {
        storeIncharges.append(storeIncharge)
    }
    
    func getAllStoreIncharges() -> [StoreIncharge] {
        return storeIncharges
    }
    
    func isStoreInchargePresent(_ name: String) -> Bool {
        return storeIncharges.contains{ storeIncharge -> Bool in
            return storeIncharge.name == name
        }
    }
    
    func getStoreIncharge(from name: String) -> StoreIncharge? {
        for storeIncharge in storeIncharges{
            if(name == storeIncharge.name){
                return storeIncharge
            }
        }
        return nil
    }
    
    func addMedicine(_ medicine: Medicine) {
        medicines.append(medicine)
    }
    
    func getAllMedicines() -> [Medicine] {
        return medicines
    }
    
    func removeMedicine(atIndex index: Int) {
        medicines.remove(at: index)
    }
    
    func addCompany(_ company: Company) {
        companies.append(company)
    }
    
    func getAllCompanies() -> [Company] {
        return companies
    }
    
    func removeCompany(atIndex index: Int) {
        companies.remove(at: index)
    }
    
    func addCategory(_ category: Category) {
        categories.append(category)
    }
        
    func getAllCategories() -> [Category] {
        return categories
    }
    
    func removeCategory(atIndex index: Int){
        categories.remove(at: index)
    }
    
    func addCustomer(_ customer: Customer) {
        customers.append(customer)
    }
        
    func getAllCustomers() -> [Customer] {
        return customers
    }
    
    func removeCustomer(atIndex index: Int) {
        customers.remove(at: index)
    }
    
    func addSalesRecord(_ customer: SalesRecord) {
        salesRecords.append(customer)
    }
        
    func getAllSalesRecords() -> [SalesRecord] {
        return salesRecords
    }
    
    func removeSalesRecord(atIndex index: Int) {
        salesRecords.remove(at: index)
    }
}
