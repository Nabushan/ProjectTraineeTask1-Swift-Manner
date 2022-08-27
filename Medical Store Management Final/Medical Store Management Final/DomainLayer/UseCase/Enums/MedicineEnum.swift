//
//  MedicineEnum.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

enum MedicineFunctionality: Int, CaseIterable, MenuRequirmentProtocol, StoreInchargeAccessProtocol {
    case add = 1
    case update
    case display
    case remove
    case back

    var menuItem: String {
        switch(self){
        case .add: return "To add Medicine"
        case .update: return "To update Medicine"
        case .display: return "To display Medicine"
        case .remove: return "To remove Medicine"
        case .back: return "To go Back"
        }
    }
    
    static var roleFunctionalitiesMapping: [Role: [Self]] {
        let access: [Role: [Self]] = [Role.admin: [Self.add, Self.update, Self.display, Self.remove, Self.back],
                                      Role.storeIncharge: [Self.display, Self.back]]
        
        return access
    }
    
    static var getArray: [Self] {
        return MedicineFunctionality.allCases.map{ $0.self }
    }
}

enum MedicineUpdateField: Int, CaseIterable, MenuRequirmentProtocol {
    case name = 1
    case expiryDate
    case dosage
    case supplierId
    case usage
    case price
    
    var menuItem: String {
        switch(self){
        case .name: return "To update Name"
        case .expiryDate: return "To update Expiry Date"
        case .dosage: return "To update Dosage"
        case .supplierId: return "To udpate Supplier Id"
        case .usage: return "To update Usage"
        case .price: return "To update Price"
        }
    }
    
    var message: String {
        switch(self){
        case .name: return " new Name : "
        case .expiryDate: return " new Expiry Date : "
        case .dosage: return " new Dosage : "
        case .supplierId: return " new Supplier Id : "
        case .usage: return " new Usage : "
        case .price: return " new Price : "
        }
    }
}

enum MedicineDisplayFunctionality: Int, CaseIterable, MenuRequirmentProtocol {
    case allMedicines = 1
    case byName
    
    var menuItem: String {
        switch(self){
        case .allMedicines: return "To display All Medicines"
        case .byName: return "To display by Name"
        }
    }

}
