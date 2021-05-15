//
//  ViewController.swift
//  Patterns
//
//  Created by Nicklas Pekkarinen on 2021-05-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appleStepper: UIStepper!
    @IBOutlet weak var appleCount: UILabel!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pearStepper: UIStepper!
    @IBOutlet weak var pearLabel: UILabel!
    @IBOutlet weak var melonStepper: UIStepper!
    @IBOutlet weak var melonCount: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var discountedCostLabel: UILabel!
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        guard let stepper = sender as? UIStepper else {
            return
        }
        switch stepper {
        case appleStepper:
            if Int(stepper.value) > cart.getItemQuantity(item: apple) {
                cart.addCartItem(item: apple)
            } else {
                cart.removeCartItem(item: apple)
            }
            appleCount.text = cart.getItemQuantity(item: apple).description
            getTotalCost()
        case bananaStepper:
            if Int(stepper.value) > cart.getItemQuantity(item: banana) {
                cart.addCartItem(item: banana)
            } else {
                cart.removeCartItem(item: banana)
            }
            bananaCount.text = cart.getItemQuantity(item: banana).description
            getTotalCost()
        case pearStepper:
            if Int(stepper.value) > cart.getItemQuantity(item: pear) {
                cart.addCartItem(item: pear)
            } else {
                cart.removeCartItem(item: pear)
            }
            pearLabel.text = cart.getItemQuantity(item: pear).description
            getTotalCost()
        case melonStepper:
            if Int(stepper.value) > cart.getItemQuantity(item: melon) {
                cart.addCartItem(item: melon)
            } else {
                cart.removeCartItem(item: melon)
            }
            melonCount.text = cart.getItemQuantity(item: melon).description
            getTotalCost()
        default:
            break
        }
    }
    
    private let apple = Product(name: "Apple", cost: 1.50)
    private let banana = Product(name: "Banana", cost: 2.25)
    private let pear = Product(name: "Pear", cost: 1)
    private let melon = Product(name: "Watermelon", cost: 3.50)
    private var cart = ShoppingCart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getTotalCost() {
        if let discountedCost = cart.calculateDiscountedCost(), discountedCost < cart.calculateTotalCost() {
            self.discountedCostLabel.text = discountedCost.description + "$"
            self.discountedCostLabel.isHidden = false
            
            let attributedString = NSMutableAttributedString(string: cart.calculateTotalCost().description + "$")
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
            
            self.totalCostLabel.attributedText = attributedString
        } else {
            self.discountedCostLabel.isHidden = true
            
            let attributedString = NSMutableAttributedString(string: cart.calculateTotalCost().description + "$")
            attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributedString.length))
            
            self.totalCostLabel.attributedText = attributedString
            
        }
    }
}

