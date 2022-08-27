//
//  Helper.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

let optionFailure = "Failed to fetch choice."
let messageEmpty = "Empty value passed for "
var defaultMessage = "Please enter a Valid Choice."
var category = ""
var optedMessage = ""
var commonUpdateMessage: String {
    "Enter the name of the \(category) you'd like to update."
}

func getAllOptionsFor<T: MenuRequirmentProtocol & CaseIterable & RawRepresentable>(_ enumType: T.Type) -> String {
    var tempString = ""
    for enumVal in T.allCases {
        tempString+="\(enumVal.rawValue) -> \(enumVal.menuItem)\n"
    }
    return tempString
}

func getAllOptionsFor(role: Role, with mapping: [Role : [StoreInchargeAccessProtocol & MenuRequirmentProtocol]]) -> String {
    var tempString = ""
    let tempArray = mapping[role]
    
    guard let _tempArray = tempArray else {
        return ""
    }
    
    for index in 0..<_tempArray.count {
        tempString+="\(index+1) -> \(_tempArray[index].menuItem)\n"
    }
    return tempString
}

func displayAndFetchOption(toShow show: String) -> Int? {
    print(show)
    
    guard let chosenOption = readInt()else {
        return nil
    }
    
    return chosenOption
}

func getInformationToRemove(toShow show: String) -> String? {
    print("Enter the name of \(show) to remove : ")
    guard let name = readString() else {
        print(messageEmpty+"Name")
        return nil
    }
    
    return name
}

func getEquivalentOption<T: StoreInchargeAccessProtocol & MenuRequirmentProtocol & Equatable>(_ role: Role ,_ option: Int, enumType: T.Type) -> Int {
    let dict = enumType.roleFunctionalitiesMapping
    let arr = dict[role]
    
    if(arr == nil){
        print("ERROR : Access not fetched.")
        return -1
    }
    
    let allCaseArray = enumType.getArray
    
    for index in 0..<allCaseArray.count {
        if(allCaseArray[index] == arr?[option-1]){
            return index+1
        }
    }
    return -1
}

func readDetailsForUpdate(printMessage categoryMessage: String, UpdateFieldMessage updateFieldMessage: String) -> UpdateInfo? {
    print(categoryMessage)
    guard let name = readString() else {
        print(messageEmpty+"Name field")
        return nil
    }
    
    print(updateFieldMessage)
    guard let updateValue = readString() else {
        print(messageEmpty+"Update field")
        return nil
    }
    
    let updateContainer = UpdateInfo(name: name, updateVal: updateValue)
    return updateContainer
}

func readInt() -> Int? {
    let choice = readLine()
    
    guard let _choice = choice,let choiceInt = Int(_choice) else {
        print(optionFailure)
        return nil
    }
    
    return choiceInt
}

func readString() -> String? {
    let string = readLine()
    
    guard let _string = string,_string.count != 0 else {
        print("Empty String entered")
        return ""
    }
    
    return _string
}

class Helper {
    func loadRequirments(){
        self.loadAdmins()
        self.loadCompanies()
        self.loadMedicines()
        self.loadSalesRecords()
    }
        
    func loadCompanies() {
        Storage.sharedInstance.addCompany(Company(name: "Sri Krishna Pharma", medicineManufactured: "Paracetamol", companyLocation: "India"))
        
        Storage.sharedInstance.addCompany(Company(name: "Estrellas Life Sciences Private Limited", medicineManufactured: "Anti-inflammatory painkillers", companyLocation: "India"))
        
        Storage.sharedInstance.addCompany(Company(name: "Esquire Drug House", medicineManufactured: "Antacids", companyLocation: "India"))
    }
    
    func loadMedicines() {
        Storage.sharedInstance.addMedicine(Medicine(name: "Paracetamol", expiryDate: "2023-04-03", dosage: "650mg", suppliedById: 0, usage: "Paracetamol eases pain. It also reduces high temperature (fever)", pricePerMedicine: "10"))
        
        Storage.sharedInstance.addMedicine(Medicine(name: "Brufen", expiryDate: "2024-05-03", dosage: "250mg", suppliedById: 1, usage: "These are painkillers which also reduce inflammation", pricePerMedicine: "200"))
        
        Storage.sharedInstance.addMedicine(Medicine(name: "Diegene", expiryDate: "2023-04-03", dosage: "50mg", suppliedById: 2, usage: "To provide effective relief from acidity and its symptoms such as heartburn, stomach discomfort, and abdominal pain", pricePerMedicine: "107"))
    }
    
    func loadSalesRecords() {
        Storage.sharedInstance.addSalesRecord(SalesRecord(individualName: "Mr.X", individualMobileNumber: "9375816475", prescribedBy: "Dr.Y", medicineId: 0, quantityPurchased: 5, medicinePrice: 10, purchaseDate: "2023-04-03"))
    }
    
    func loadAdmins() {
        Storage.sharedInstance.addAdmin(Admin(name: "Nabushan B", password: "Yellow@1412", role: .admin))
    }
}
