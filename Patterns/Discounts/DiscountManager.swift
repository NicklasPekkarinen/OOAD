//
//  DiscountManager.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

class DiscountManager {
    let cheapestFree = CheapestFree()
    let threeForTwo = ThreeForTwo()
    let tenPercentOffTotal = TenPercentOffTotal()
    
    var discounts: Array<DiscountProtocol>
    let items: Dictionary<Product, Int>
    
    init(items: Dictionary<Product, Int>) {
        self.items = items
        self.discounts = [self.cheapestFree, self.threeForTwo, self.tenPercentOffTotal]
    }
    
    func getMostProfitableDiscount() -> DiscountProtocol? {
        var mostProfitableDiscount: DiscountProtocol? = nil
        
        for discount in discounts {
            if (mostProfitableDiscount == nil) {
                mostProfitableDiscount = discount
            }
            if ((mostProfitableDiscount?.calculateTotalCost(items: self.items))!) > discount.calculateTotalCost(items: self.items) {
                mostProfitableDiscount = discount
            }
        }
        
        return mostProfitableDiscount
    }
}
