//
//  Medicine.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class Medicine: EntityRequirment {
    var name: String
    var expiryDate: String
    var dosage: String
    var suppliedById: Int
    var usage: String
    var pricePerMedicine: String{
        didSet{
            self.pricePerMedicine = "Rs." + pricePerMedicine
        }
    }
    var description: String{
        return """
            [Medicine Name = \(name),
             Expiry Date = \(expiryDate),
             Dosage = \(dosage),
             Usage = \(usage),
             Supplied By Id = \(suppliedById),
             Price Per Medicine = \(pricePerMedicine)]
            
            """
    }
    
    init(name: String, expiryDate: String, dosage: String, suppliedById: Int, usage: String, pricePerMedicine: String) {
        self.name = name
        self.expiryDate = expiryDate
        self.dosage = dosage
        self.suppliedById = suppliedById
        self.usage = usage
        self.pricePerMedicine = "Rs."+pricePerMedicine
    }
    
    func addMedicine(){
        Storage.sharedInstance.addMedicine(self)
    }
    
    func updateMedicine(option opted: MedicineUpdateField,_ updateVal: String){
        switch(opted){
        case .name:
            self.name = updateVal
            
        case .expiryDate:
            do{
                try Validator.isDateValid(updateVal)
            }
            catch{
                print(error)
                return
            }
            self.expiryDate = updateVal
            
        case .dosage:
            self.dosage = updateVal
            
        case .supplierId:
            guard let id = Int(updateVal) else {
                print("Failed to update Id")
                return
            }
            
            self.suppliedById = id
            
        case .usage:
            self.usage = updateVal
            
        case .price:
            self.pricePerMedicine = updateVal
            
        }
    }
}
