//
//  MedicineMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

struct UpdateInfo {
    let name: String
    let updateVal: String
}

class MedicineMenu: CategoryMenu, MedicineProtocol {
    let medicineMenuUtil: MedicineMenuUtil
    
    lazy var companyMenu: CompanyMenu = { 
        let menu = CompanyMenu(category: CompanyFunctionality.add)
        return menu
    }()
    
    override init(category: MenuRequirmentProtocol & StoreInchargeAccessProtocol){
        medicineMenuUtil = MedicineMenuUtil()
        super.init(category: category)
        categoryUtil = medicineMenuUtil
        medicineMenuUtil.medicineMenuDelegate = self
    }
    
    func showMenu(role: Role){
        guard var option = showMenuFor(role: role) else {
            return
        }
        
        option = getEquivalentOption(role, option,enumType: MedicineFunctionality.self)
        
        if(option == -1){
            return
        }
        
        medicineMenuUtil.didSelectFunctionalityOption(option)
    }
    
    func showUpdateOptions() {
        showUpdateMenu(for: MedicineUpdateField.self)
    }
    
    func showDisplayOptions(){
        showDisplayMenu(for: MedicineDisplayFunctionality.self)
    }
    
    func displayAllMedicines(){
        displayAllDetails(for: .medicine)
    }
    
    override func getAllItems() -> [EntityRequirment] {
        return Storage.sharedInstance.getAllMedicines()
    }
    
    func displayMedicineAndId(){
        let medicines = Storage.sharedInstance.getAllMedicines()
        
        for index in 0..<medicines.count {
            print("""
            [Medicine Id = \(index),
             Medicine Name = \(medicines[index].name)]
            
            """)
        }
    }
        
    func displayMedicine(){
        print("Enter the name of medicine to display : ")
        guard let name = readString() else {
            return
        }
        
        let medicines = Storage.sharedInstance.getAllMedicines()
        
        medicines.forEach{ medicine in
            if(medicine.name == name){
                print(medicine.description)
            }
        }
    }
    
    func readMedicineDetail() -> Medicine? {
        print("Enter the Medicine Name : ")
        guard let medicineName = readString() else {
            return nil
        }
        
        print("Enter the Expiry date for the Medicine (yyyy-mm-dd) : ")
        guard let date = readString() else {
            return nil
        }
        
        do {
            try Validator.isDateValid(date)
        }
        catch Validator.DateError.UnformattedDate {
            print("The entered date is Unformatted.")
            return nil
        }
        catch Validator.DateError.IllegalMonth {
            print("Entered Month value is out of bounds.")
            return nil
        }
        catch Validator.DateError.IllegalDate {
            print("Entered Date value is out of bounds.")
            return nil
        }
        catch Validator.DateError.AlreadyExpired {
            print("Entered Date is already Expired.")
            return nil
        }
        catch {
            print("Error caught : ",error)
            return nil
        }
        
        print("Enter the Medicine Dosage : ")
        guard let dosage = readString() else {
            return nil
        }
        
        print("Enter the medicine usage criteria : ")
        guard let usage = readString() else {
            return nil
        }
        
        companyMenu.displayCompanyNamesWithId()
        
        print("Enter the Company Id : ")
        guard let companyIdVal = readString() else {
            return nil
        }
        
        guard let companyId = Int(companyIdVal) else {
            print("Failed to fetch Company Id.")
            return nil
        }
        
        print("Enter the price per Medicine : ")
        guard let pricePerMedicine = readString() else {
            return nil
        }
        
        let medicine = Medicine(name: medicineName, expiryDate: date, dosage: dosage, suppliedById: companyId, usage: usage, pricePerMedicine: pricePerMedicine)
        return medicine
    }

    func getInfoToRemove(toShow show: String) -> String? {
        return getInformationToRemove(toShow: show)
    }
    
    func readUpdateDetailWith(categoryInputMessage categoryMessage: String, fieldInputMessage fieldMessage: String) -> UpdateInfo? {
        return readDetailsForUpdate(printMessage: categoryMessage, UpdateFieldMessage: fieldMessage)
    }
}
