//
//  ShoppingCart.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-15.
//

import Foundation

class ShoppingCart {
    var items: Dictionary<Product, Int>
    
    init() {
        self.items = [Product:Int]()
    }
    
    func addCartItem(item: Product) {
        items[item]! += 1
    }
    
    func removeCartItem(item: Product) {
        if items[item]! > 0 {
            items[item]! -= 1
        }
    }
    
    func getItemQuantity(item: Product) -> Int {
        if items[item] == nil {
            items[item] = 0
        }
        return items[item]!
    }
    
    func calculateTotalCost() -> Double {
        var sum = 0.0
            
        for item in self.items.keys {
            sum += item.cost * Double(items[item]!)
        }
            
        return sum
    }
    
    func calculateDiscountedCost() -> Double? {
        let discountManager = DiscountManager(items: self.items)
        
        if let discount = discountManager.getMostProfitableDiscount() {
            return discount.calculateTotalCost(items: self.items)
        }
        
        return nil
    }
}
