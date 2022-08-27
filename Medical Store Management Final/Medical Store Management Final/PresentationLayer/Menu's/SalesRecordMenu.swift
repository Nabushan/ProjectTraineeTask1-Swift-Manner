//
//  SalesRecordMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class SalesRecordMenu: CategoryMenu, SalesRecordProtocol {
    let salesRecordMenuUtil: SalesRecordMenuUtil
    
    lazy var medicineMenu: MedicineMenu = {
        let menu = MedicineMenu(category: MedicineFunctionality.add)
        return menu
    }()
    
    override init(category: MenuRequirmentProtocol & StoreInchargeAccessProtocol) {
        salesRecordMenuUtil = SalesRecordMenuUtil()
        super.init(category: category)
        categoryUtil = salesRecordMenuUtil
        salesRecordMenuUtil.salesRecordMenuDelegate = self
    }

    func showMenu(role: Role) {
        guard var option = showMenuFor(role: role) else {
            return
        }
        
        option = getEquivalentOption(role, option, enumType: SalesRecordFunctionality.self)
        
        salesRecordMenuUtil.didSelectFunctionalityOption(option)
    }

    func showUpdateOptions() {
        showUpdateMenu(for: SalesRecordUpdateField.self)
    }

    func showDisplayOptions(){
        showDisplayMenu(for: SalesRecordDisplayFunctionality.self)
    }

    func displayAllSalesRecords(){
        displayAllDetails(for: .salesRecord)
    }
    
    override func getAllItems() -> [EntityRequirment] {
        return Storage.sharedInstance.getAllSalesRecords()
    }
    
    func displaySalesRecordByName(){
        print("Enter the name of Individual to display : ")
        guard let name = readString() else {
            print("Empty Name Passed.")
            return
        }
        
        let salesRecords = Storage.sharedInstance.getAllSalesRecords()
        
        salesRecords.forEach{ salesRecord in
            if(salesRecord.individualName == name){
                print(salesRecord.description)
            }
        }
    }
    
    func displaySalesRecordById() {
        let salesRecords = Storage.sharedInstance.getAllSalesRecords()
        
        print("Enter the Id of Individual to display : ")
        guard let id = readInt() else {
            return
        }
        
        if(id < salesRecords.count){
            print(salesRecords[id].description)
        }
        else{
            print("Unable to display due to lack of availability of required resources.")
            return
        }
    }
    
    func displaySalesRecordByNameAndNumber() {
        let salesRecords = Storage.sharedInstance.getAllSalesRecords()
        
        print("Enter the name of Individual to display : ")
        guard let name = readString() else {
            print("Empty name passed.")
            return
        }
        
        print("Enter the number of Individual to display : ")
        guard let number = readString() else {
            print("Empty number passed.")
            return
        }
        
        if(!Validator.isMobileNumberValid(number)){
            print("Invalid mobile Number.")
            return
        }
        
        salesRecords.forEach{ salesRecord in
            if(salesRecord.individualName == name && salesRecord.individualMobileNumber == number){
                print(salesRecord.description)
            }
        }
    }
    
    func readCustomerDetail() -> Customer? {
        print("Enter the Name of the Customer : ")
        guard let name = readString() else {
            return nil
        }
        
        print("Enter the Contact number of the Customer : ")
        guard let phoneNumber = readString() else {
            return nil
        }
        
        let isNumberValid: Bool = Validator.isMobileNumberValid(phoneNumber)
        
        if(!isNumberValid) {
            print("The entered Contact number is Invalid.")
            return nil
        }
        
        print("Enter the Purchase Date(yyyy-mm-dd) : ")
        guard let purchseDate = readString() else {
            return nil
        }
        
        do {
            try Validator.isDateValid(purchseDate)
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
        
        let customer = Customer(customerName: name, contactNumber: phoneNumber, purchaseDate: purchseDate)
        return customer
    }
    
    func readSalesRecordDetail() -> SalesRecord? {
        
        let customer = self.readCustomerDetail()
        
        if(customer == nil){
            return nil
        }
        
        print("Enter the name of the Doctor who issued prescription : ")
        guard let docName = readString() else {
            return nil
        }
        
        medicineMenu.displayMedicineAndId()
        
        print("Enter the Medicine Id : ")
        guard let medicine = readString() else {
            return nil
        }
        
        guard let medicineId = Int(medicine) else {
            print("Error during medicine Int conversion")
            return nil
        }
        
        print("Enter the quantity of the Medicine Purchased : ")
        guard let quantity = readString() else {
            return nil
        }
        
        guard let quantityOfMedicine = Int(quantity) else {
            print("Error during Quantity Int conversion")
            return nil
        }

        
        let medicines = Storage.sharedInstance.getAllMedicines()
        var medPrice: String = ""
        if(medicineId < medicines.count){
            medPrice = medicines[medicineId].pricePerMedicine
        }
        else{
            print("Unable to proceed further due to lack of availability of required resources.")
            return nil
        }
        let medPriceRange = medPrice.index(medPrice.startIndex, offsetBy: 3)...
        let medicinePrice = Int(String(medPrice[medPriceRange])) ?? 0
        
        var salesRecord: SalesRecord? = nil
        
        if let customer = customer {
            customer.addCustomer()
            
            salesRecord = SalesRecord(individualName: customer.name, individualMobileNumber: customer.contactNumber, prescribedBy: docName, medicineId: medicineId, quantityPurchased: quantityOfMedicine, medicinePrice: medicinePrice, purchaseDate: customer.purchaseDate)
            
        }
        else{
            print("Details not Fetched.")
            return nil
        }

        return salesRecord
    }
    
    func getInfoToRemove(toShow name: String) -> String? {
        return getInformationToRemove(toShow: name)
    }
    
    func readUpdateDetailWith(categoryInputMessage categoryMessage: String, fieldInputMessage: String) -> UpdateInfo? {
        return readDetailsForUpdate(printMessage: categoryMessage, UpdateFieldMessage: fieldInputMessage)
    }
}
