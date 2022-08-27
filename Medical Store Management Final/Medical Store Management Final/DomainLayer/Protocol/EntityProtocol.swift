//
//  EntityProtocol.swift
//  Medical Store Management Final
//
//  Created by nabushan-pt5611 on 19/08/22.
//

import Foundation

protocol EntityRequirment {
    var description: String { get }
}

protocol Individual {
    var name: String { get }
    var password: String { get }
    var role: Role { get }
}
