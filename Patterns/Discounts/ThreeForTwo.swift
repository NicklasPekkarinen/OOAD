//
//  ThreeForTwo.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

class ThreeForTwo: DiscountProtocol {
    func calculateTotalCost(items: Dictionary<Product, Int>) -> Double {
        var sum = 0.0
        
        for item in items.keys {
            sum += item.cost * Double(items[item]!)
            if items[item]! >= 3 {
                sum -= item.cost
            }
        }
        
        return sum
    }
}
