//
//  Product.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

struct Product: Hashable {
    let name: String
    let cost: Double
    
    init(name: String, cost: Double) {
        self.name = name
        self.cost = cost
    }
}
