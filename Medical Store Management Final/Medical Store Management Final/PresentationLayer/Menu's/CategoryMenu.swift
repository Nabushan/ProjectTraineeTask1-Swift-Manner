//
//  CategoryMenu.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

class CategoryMenu: CategoryMenuProtocol {
    typealias CategoryProtocol = MenuRequirmentProtocol & StoreInchargeAccessProtocol
    
    var categoryUtil: CategoryUtil = CategoryUtil()
    var category: CategoryProtocol
    
    init(category: CategoryProtocol){
        self.category = category
    }
    
    func showMenuFor(role: Role) -> Int? {
        let categoryType = type(of: category)
        
        print(getAllOptionsFor(role: role, with: categoryType.roleFunctionalitiesMapping))
        guard let option = readInt() else {
            return nil
        }
        
        return option
    }
    
    func didSelectFunctionalityOption(_ option: Int) {
        
    }
    
    func showUpdateMenu<T: MenuRequirmentProtocol & CaseIterable & RawRepresentable>(for item: T.Type) {
        print(getAllOptionsFor(item.self))
        guard let option = readInt() else {
            return
        }
        
        categoryUtil.didSelectUpdate(option)
    }
    
    func showDisplayMenu<T: MenuRequirmentProtocol & CaseIterable & RawRepresentable>(for item: T.Type) {
        print(getAllOptionsFor(item.self))
        guard let option = readInt() else {
            return
        }
        
        categoryUtil.didSelectDisplay(option)
    }
    
    func getAllItems() -> [EntityRequirment]{
        return []
    }
    
    func displayAllDetails(for category: AvailableCategory){        
        getAllItems().forEach{ item -> () in
            print("""
                  \(item.description)
                  
                  """)
        }
    }
}
