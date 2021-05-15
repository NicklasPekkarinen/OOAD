//
//  TenPercentOffTotal.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

class TenPercentOffTotal: DiscountProtocol {
    func calculateTotalCost(items: Dictionary<Product, Int>) -> Double {
        var sum = 0.0
        
        for item in items.keys {
            sum += item.cost * Double(items[item]!)
        }
        
        if sum >= 100 {
            sum -= sum * 0.10
        }
        
        return sum
    }
}
