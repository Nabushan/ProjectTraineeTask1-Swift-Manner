//
//  SalesRecordEnum.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

enum SalesRecordFunctionality: Int, CaseIterable, MenuRequirmentProtocol, StoreInchargeAccessProtocol {
    case add = 1
    case update
    case display
    case remove
    case back

    var menuItem: String {
        switch(self){
        case .add: return "To add Sales Record"
        case .update: return "To update Sales Record"
        case .display: return "To display Sales Record"
        case .remove: return "To remove Sales Record"
        case .back: return "To go Back"
        }
    }
    
    static var roleFunctionalitiesMapping: [Role: [Self]] {
        let access: [Role: [Self]] = [Role.admin: [Self.add, Self.update, Self.display, Self.remove, Self.back],
                                          Role.storeIncharge: [Self.add, Self.update, Self.display, Self.back]]
        
        return access
    }
    
    static var getArray: [Self] {
        return SalesRecordFunctionality.allCases.map{ $0.self }
    }
}

enum SalesRecordUpdateField: Int, CaseIterable, MenuRequirmentProtocol {
    case name = 1
    case number
    case prescribedBy
    case medicineId
    case quantityPurchased
    case medicinePrice
    case purchaseDate
    
    var menuItem: String {
        switch(self){
        case .name: return "To update Name"
        case .number: return "To update the Contact Number"
        case .prescribedBy: return "To udpdate the Prescribed By details"
        case .medicineId: return "To update the Medicine Id"
        case .quantityPurchased: return "To update the Quantity Purchased"
        case .medicinePrice: return "To update the Medicine Price"
        case .purchaseDate: return "To update the Purchase Date(yyyy-mm-dd)"
        }
    }
    
    var message: String {
        switch(self){
        case .name: return " new Name : "
        case .number: return " new Contact Number : "
        case .prescribedBy: return " new Prescribed By details : "
        case .medicineId: return " new Medicine Id : "
        case .quantityPurchased: return " new Quantity Purchased : "
        case .medicinePrice: return " new Medicine Price : "
        case .purchaseDate: return " new Purchase Date(yyyy-mm-dd) : "
        }
    }
}

enum SalesRecordDisplayFunctionality: Int, CaseIterable, MenuRequirmentProtocol {
    case allSalesRecord = 1
    case byId
    case byName
    case byNameAndNumber
    
    var menuItem: String {
        switch(self){
        case .allSalesRecord: return "To display All Sales Record"
        case .byId: return "To display by Id"
        case .byName: return "To display by Name"
        case .byNameAndNumber: return "To display by Name and Number"
        }
    }
}

enum SalesRecordRemovalFunctionality: Int, CaseIterable, MenuRequirmentProtocol {
    case byName = 1
    case byNameAndNumber
    
    var menuItem: String {
        switch(self){
        case .byName: return "To remove by Name"
        case .byNameAndNumber: return "To remove by Name and Number"
        }
    }
}
