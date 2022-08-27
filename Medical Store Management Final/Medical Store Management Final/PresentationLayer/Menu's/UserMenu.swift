//
//  UserMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class UserMenu: UserProtocol {
    let optionFailure = "Failed to fetch choice."
    let messageEmpty = "Empty value passed for "
    let userAccessMenuUtil: UserMenuUtil = UserMenuUtil()
    
    init(){
        userAccessMenuUtil.userMenuDelegate = self
    }
    
    func showMenu() {
        print(getAllOptionsFor(LogInAs.self))
        guard let choice = readInt() else {
            return
        }
        
        userAccessMenuUtil.didChoseCategory(choice)
    }
    
    func validateUser() -> Admin? {
        if(Storage.sharedInstance.getAllAdmins().count == 0) {
            print("No Admin entry found, Please sign up.")
            return nil
        }
        
        var invalidAttempts: Int = 0
        while(true) {
            print("Enter the user Name to log-in: ")
            guard let userName = readString() else {
                return nil
            }
            
            if(userName.count == 0){
                return nil
            }
            let admin = Admin(name: userName, password: "", role: .admin)
            if(admin.isOneOfUsers()) {
                while(true) {
                    if(invalidAttempts == 3) {
                        print("Maximum Trial count reached.")
                        return nil
                    }
                    
                    print("Enter the password : ")
                    let pass = readLine()
                    
                    guard let password = pass,password.count != 0 else {
                        print("Password field is empty.")
                        break
                    }
                    
                    if(admin.checkPassword(password)) {
                        admin.password = password
                        admin.role = .admin
                        return admin
                    }
                    else {
                        print("Password didnt match try again later.")
                        invalidAttempts+=1
                    }
                }
            }
            else {
                print("Entered admin name is not present. Please enter a Valid Admin Name.")
            }
        }
    }
}
