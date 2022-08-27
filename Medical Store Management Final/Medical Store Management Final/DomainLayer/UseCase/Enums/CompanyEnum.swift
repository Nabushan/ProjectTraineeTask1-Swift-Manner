//
//  CompanyEnum.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

enum CompanyFunctionality: Int, CaseIterable, MenuRequirmentProtocol, StoreInchargeAccessProtocol {
    case add = 1
    case update
    case display
    case remove
    case back

    var menuItem: String {
        switch(self){
        case .add: return "To add Company"
        case .update: return "To update Company"
        case .display: return "To display Company"
        case .remove: return "To remove Company"
        case .back: return "To go Back"
        }
    }
    
    static var roleFunctionalitiesMapping: [Role: [Self]] {
        let access: [Role: [Self]] = [Role.admin: [Self.add, Self.update, Self.display, Self.remove, Self.back],
                                      Role.storeIncharge: [Self.display, Self.back]]
        
        return access
    }
    
    static var getArray: [Self] {
        return CompanyFunctionality.allCases.map{ $0.self }
    }
}

enum CompanyUpdateField: Int, CaseIterable, MenuRequirmentProtocol {
    case name = 1
    case medicineManufactured
    case location
    
    var menuItem: String {
        switch(self){
        case .name: return "To update Name"
        case .medicineManufactured: return "To update Contact Number"
        case .location: return "To update Location"
        }
    }
    
    var message: String {
        switch(self){
        case .name: return " new Name : "
        case .medicineManufactured: return " new Contact Number"
        case .location: return " new Location"
        }
    }
}

enum CompanyDisplayFunctionality: Int, CaseIterable, MenuRequirmentProtocol {
    case allCompanies = 1
    case byName
    case nameWithId
    
    var menuItem: String {
        switch(self){
        case .allCompanies: return "To display All Companies"
        case .byName: return "To display by Name"
        case .nameWithId: return "To display using Name and Id"
        }
    }
}

