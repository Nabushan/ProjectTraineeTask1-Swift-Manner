//
//  MedicineMenuUtil.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class MedicineMenuUtil: CategoryUtil {
    weak var medicineMenuDelegate: MedicineProtocol?
    weak var goBackDelegate: GoBackProtocol?
    
    override func didSelectFunctionalityOption(_ choice: Int){
        let opted = MedicineFunctionality(rawValue: choice)
        switch(opted){
        case .add:
            let medicine = medicineMenuDelegate?.readMedicineDetail()
            medicine?.addMedicine()
            medicineMenuDelegate?.showMenu(role: LoggedInUser.user.role)
            
        case .update:
            medicineMenuDelegate?.showUpdateOptions()
            medicineMenuDelegate?.showMenu(role: LoggedInUser.user.role)
            
        case .display:
            medicineMenuDelegate?.showDisplayOptions()
            medicineMenuDelegate?.showMenu(role: LoggedInUser.user.role)
            
            
        case .remove:
            medicineMenuDelegate?.displayAllMedicines()
            
            guard let medName = medicineMenuDelegate?.getInfoToRemove(toShow: "Medicine"), medName.count != 0 else {
                print("Medicine name to remove is empty.")
                return
            }
            self.removeMedicine(medName)
            medicineMenuDelegate?.showMenu(role: LoggedInUser.user.role)
            
        case .back:
            goBackDelegate?.goBack()
            return
            
        default:
            print(defaultMessage)
        }
    }
    
    override func didSelectUpdate(_ choice: Int){
        guard let opted = MedicineUpdateField(rawValue: choice) else {
            print("Failed to update.")
            return
        }
        
        category = "Medicine"
        
        let optedMessage = opted.message
        
        medicineMenuDelegate?.displayAllMedicines()
        
        guard let updateContainer = medicineMenuDelegate?.readUpdateDetailWith(categoryInputMessage: commonUpdateMessage, fieldInputMessage: "Enter the new" + optedMessage) else {
            print("Failed to Update.")
            return
        }
        
        let medicine: Medicine? = getMedicine(updateContainer.name)
        
        medicine?.updateMedicine(option: opted, updateContainer.updateVal)
    }
    
    override func didSelectDisplay(_ choice: Int){
        
        let opted = MedicineDisplayFunctionality(rawValue: choice)
        switch(opted){
        case .allMedicines:
            medicineMenuDelegate?.displayAllMedicines()
            
        case .byName:
            medicineMenuDelegate?.displayMedicine()
            
        default:
            print(defaultMessage)
        }
    }
    
    func getMedicine(_ name: String) -> Medicine? {
        let medicines = Storage.sharedInstance.getAllMedicines()
        for medicine in medicines {
            if(medicine.name == name){
                return medicine
            }
        }
        return nil
    }
    
    func removeMedicine(_ name: String){
        if(name.count == 0){
            print("Removal Failed due to empty String.")
        }
        
        let medicines = Storage.sharedInstance.getAllMedicines()
        
        for index in 0..<medicines.count {
            if(medicines[index].name == name){
                Storage.sharedInstance.removeMedicine(atIndex: index)
                return
            }
        }
        
        print("Removal Failed, since value entered is not available.")
    }
}
