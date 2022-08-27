//
//  SalesRecord.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class SalesRecord: EntityRequirment {
    var individualName: String
    var individualMobileNumber: String
    var prescribedBy: String
    var medicineId: Int
    var quantityPurchased: Int{
        didSet{
            totalCost = "Rs.\(medicinePrice * quantityPurchased)"
        }
    }
    var medicinePrice: Int{
        didSet{
            totalCost = "Rs.\(medicinePrice * quantityPurchased)"
        }
    }
    private var totalCost: String
    var purchaseDate: String
    var description: String{
        return """
            [Individual Name = \(individualName),
             Mobile Number = \(individualMobileNumber),
             Prescribed By = \(prescribedBy),
             Medicine Id = \(medicineId),
             Quantity Purchased = \(quantityPurchased),
             Medicine Price = \(medicinePrice),
             Total Cost = \(totalCost),
             Purchase Date = \(purchaseDate)]
            
            """
    }
    
    init(individualName: String, individualMobileNumber: String, prescribedBy: String, medicineId: Int, quantityPurchased: Int, medicinePrice: Int, purchaseDate: String) {
        self.individualName = individualName
        self.individualMobileNumber = individualMobileNumber
        self.prescribedBy = prescribedBy
        self.medicineId = medicineId
        self.quantityPurchased = quantityPurchased
        self.medicinePrice = medicinePrice
        self.totalCost = "Rs.\(medicinePrice * quantityPurchased)"
        self.purchaseDate = purchaseDate
    }
    
    func addSalesRecord() {
        Storage.sharedInstance.addSalesRecord(self)
    }
    
    func updateSalesRecord(option opted: SalesRecordUpdateField,_ updateVal: String){
        switch(opted){
        case .name:
            self.individualName = updateVal
            
        case .number:
            self.individualMobileNumber = updateVal
            
        case .prescribedBy:
            self.prescribedBy = updateVal
            
        case .medicineId:
            guard let medId = Int(updateVal) else {
                print("Failed to update (casting error.)")
                return
            }
            
            self.medicineId = medId
            
        case .quantityPurchased:
            guard let quantity = Int(updateVal) else {
                print("Failed to update (casting error.)")
                return
            }
            
            self.quantityPurchased = quantity
            
        case .medicinePrice:
            guard let medPrice = Int(updateVal) else {
                print("Failed to update (casting error.)")
                return
            }
            
            self.medicinePrice = medPrice
            
        case .purchaseDate:
            do{
                try Validator.isDateValid(updateVal)
            }
            catch {
                print(error)
                return
            }
            self.purchaseDate = updateVal
        }
    }
}
