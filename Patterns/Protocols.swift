//
//  Protocols.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

protocol DiscountProtocol {
    func calculateTotalCost(items: Dictionary<Product, Int>) -> Double
}
