//
//  Company.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class Company: EntityRequirment {
    var name: String
    var medicineManufactured: String
    var location: String
    var description: String{
        return """
            [Company Name = \(name),
             Medicine Manufactured = \(medicineManufactured),
             Company Location = \(location)]
            
            """
    }
    
    init(name: String, medicineManufactured: String, companyLocation: String) {
        self.name = name
        self.medicineManufactured = medicineManufactured
        self.location = companyLocation
    }
    
    func addCompany() {
        Storage.sharedInstance.addCompany(self)
    }
    
    func updateCompany(with option: CompanyUpdateField, valueToBeUpdated: String){
        switch(option){
        case .name:
            self.name = valueToBeUpdated
            
        case .medicineManufactured:
            self.medicineManufactured = valueToBeUpdated
        
        case .location:
            self.location = valueToBeUpdated
        }
    }
}
