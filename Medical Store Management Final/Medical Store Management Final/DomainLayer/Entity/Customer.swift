//
//  Customer.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class Customer {
    var name: String
    var contactNumber: String
    var purchaseDate: String
    var description: String{
        return """
            [Customer Name = \(name),
            Contact Number = \(contactNumber),
            Purchase Date = \(purchaseDate)]
            
            """
    }
    
    init(customerName: String, contactNumber: String, purchaseDate: String){
        self.name = customerName
        self.contactNumber = contactNumber
        self.purchaseDate = purchaseDate
    }
    
    func addCustomer() {
        Storage.sharedInstance.addCustomer(self)
    }
    
    func updateCategory(option opted: SalesRecordUpdateField,_ updateVal: String) {
        switch(opted){
        case .name:
            self.name = updateVal
            
        case .number:
            self.contactNumber = updateVal
            
        case .purchaseDate:
            do{
                try Validator.isDateValid(updateVal)
            }
            catch {
                print(error)
                return
            }
            
            self.purchaseDate = updateVal
            
        default:
            print("Updation not possible due to the absence of field for updation.")
        }
    }
}
