//
//  Admin.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class Admin: User,Individual {
    override init(name: String,password: String,role: Role) {
        super.init(name: name,password: password, role: role)
    }
    
    func addAdmin() {
        Storage.sharedInstance.addAdmin(self)
    }
    
    override func isOneOfUsers() -> Bool {
        let admins = Storage.sharedInstance.getAllAdmins()
        return admins.contains{ admin -> Bool in
            return admin.name == self.name
        }
    }
}

class LoggedInUser {
    static var user: User = User()
}
