//
//  CommonEnumProtocol.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

protocol MenuRequirmentProtocol{
    var menuItem: String { get }
    
}

protocol StoreInchargeAccessProtocol {
    static var roleFunctionalitiesMapping: [Role : [Self]] { get }
    static var getArray: [Self] { get }
}
