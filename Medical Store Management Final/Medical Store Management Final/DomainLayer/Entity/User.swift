//
//  User.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class User: EntityRequirment {
    var name: String
    var password: String
    var role: Role = .storeIncharge
    var description: String{
        return """
                [Admin Name = \(name),
                 Password = ******** ]
               
               """
    }
    
    init(name: String = "",password: String = "",role: Role = .storeIncharge) { //
        self.name = name
        self.password = password
        self.role = role
    }
    
    func isOneOfUsers() -> Bool {
        return true
    }
    
    func checkPassword(_ password: String) -> Bool {
        var individuals: [Individual]
        switch(role){
        case .admin:
            individuals = Storage.sharedInstance.getAllAdmins()
            
        case .storeIncharge:
            individuals = Storage.sharedInstance.getAllStoreIncharges()
            
        }
        
        for individual in individuals {
            if(individual.name == self.name && individual.password == password){
                return true
            }
        }
        
        return false
    }
}
