//
//  SalesRecordUtil.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class SalesRecordMenuUtil: CategoryUtil {
    weak var salesRecordMenuDelegate: SalesRecordProtocol?
    weak var goBackDelegate: GoBackProtocol?
    
    override func didSelectFunctionalityOption(_ choice: Int){
        let opted = SalesRecordFunctionality(rawValue: choice)
        switch(opted){
        case .add:
            let salesRecord = salesRecordMenuDelegate?.readSalesRecordDetail()
            salesRecord?.addSalesRecord()
            
        case .update:
            salesRecordMenuDelegate?.showUpdateOptions()
            
        case .display:
            salesRecordMenuDelegate?.showDisplayOptions()
            
        case .remove:
            salesRecordMenuDelegate?.displayAllSalesRecords()
            
            guard let recordName = salesRecordMenuDelegate?.getInfoToRemove(toShow: "Sales Record"),recordName.count != 0 else {
                print("Sales Record name to remove is empty.")
                return
            }
            
            self.removeSalesRecord(recordName)
            
        case .back:
            goBackDelegate?.goBack()
            return
            
        default:
            print(defaultMessage)
        }
        
        salesRecordMenuDelegate?.showMenu(role: LoggedInUser.user.role)
    }
    
    override func didSelectUpdate(_ choice: Int){
        salesRecordMenuDelegate?.displayAllSalesRecords()
        
        guard let opted = SalesRecordUpdateField(rawValue: choice) else {
            print("Failed to update.")
            return
        }
        category = "Sales Record"
        
        let optedMessage = opted.message
        
        guard let updateContainer = salesRecordMenuDelegate?.readUpdateDetailWith(categoryInputMessage: commonUpdateMessage,fieldInputMessage: "Enter the new" + optedMessage) else {
            print("Failed to Update.")
            return
        }
        let salesRecord: SalesRecord? = getSalesRecord(recordName: updateContainer.name)
        
        salesRecord?.updateSalesRecord(option: opted,updateContainer.updateVal)
    }
    
    override func didSelectDisplay(_ choice: Int){
        let opted = SalesRecordDisplayFunctionality(rawValue: choice)
        switch(opted){
        case .allSalesRecord:
            salesRecordMenuDelegate?.displayAllSalesRecords()
            
        case .byName:
            salesRecordMenuDelegate?.displaySalesRecordByName()
            
        case .byId:
            salesRecordMenuDelegate?.displaySalesRecordById()
            
        case .byNameAndNumber:
            salesRecordMenuDelegate?.displaySalesRecordByNameAndNumber()
            
        default:
            print(defaultMessage)
        }
    }
    
    func getSalesRecord(recordName name: String) -> SalesRecord? {
        let salesRecords = Storage.sharedInstance.getAllSalesRecords()
        for salesRecord in salesRecords {
            if(salesRecord.individualName == name){
                return salesRecord
            }
        }
        return nil
    }
    
    func removeSalesRecord(_ name: String){
        if(name.count == 0){
            print("Removal Failed due to empty String.")
        }
        
        let salesRecords = Storage.sharedInstance.getAllSalesRecords()
        
        for index in 0..<salesRecords.count {
            if(salesRecords[index].individualName == name){
                Storage.sharedInstance.removeSalesRecord(atIndex: index)
                return
            }
        }
        
        print("Removal Failed, since value entered is not available.")
    }
}
