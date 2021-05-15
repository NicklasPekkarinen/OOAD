//
//  CheapestFree.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

class CheapestFree: DiscountProtocol {
    func calculateTotalCost(items: Dictionary<Product, Int>) -> Double {
        var sum = 0.0
        var numberOfItems = 0
        
        var sortedItems = Array(items.keys)
        sortedItems.sort {
            $0.cost < $1.cost
        }
        
        for item in items.keys {
            sum += item.cost * Double(items[item]!)
            numberOfItems += items[item]!
        }
        
        if (numberOfItems >= 5) {
            if let cheapestItemCost = sortedItems.first?.cost {
                return sum - cheapestItemCost
            }
        }
        
        return sum
    }
}
