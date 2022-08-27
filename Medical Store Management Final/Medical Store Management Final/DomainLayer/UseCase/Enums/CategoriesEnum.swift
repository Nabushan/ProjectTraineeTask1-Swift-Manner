//
//  CategoriesEnum.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

enum AvailableCategory: Int, CaseIterable, MenuRequirmentProtocol{
    case medicine = 1
    case company
    case salesRecord
    case back
    
    var menuItem: String {
        switch(self){
        case .medicine: return "Medicine"
        case .company: return "Company"
        case .salesRecord: return "Sales Record"
        case .back: return "To go back"
        }
    }
}
