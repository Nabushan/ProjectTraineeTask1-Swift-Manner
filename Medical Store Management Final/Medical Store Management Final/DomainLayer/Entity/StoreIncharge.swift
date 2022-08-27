//
//  StoreIncharge.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class StoreIncharge: User,Individual {
    
    func addStoreIncharge() {
        Storage.sharedInstance.addStoreIncharge(self)
    }
    
    override func isOneOfUsers() -> Bool {
        let storeIncharges = Storage.sharedInstance.getAllStoreIncharges()
        return storeIncharges.contains{ storeIncharge -> Bool in
            return storeIncharge.name == self.name
        }
    }
}
