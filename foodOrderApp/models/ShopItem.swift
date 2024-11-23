//
//  ShopItem.swift
//  foodOrderApp
//
//  Created by Sithum Raveesha on 2024-11-12.
//

import Foundation

class ShopItem: Identifiable {
    var name: String
    var price: Double
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}


let shopItems: [ShopItem] = [
    ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
    ShopItem(name: "Banana", price: 10.00, quantity: 0),
    ShopItem(name: "Avocado", price: 7.00, quantity: 0),
    ShopItem(name: "Chicken", price: 20.00, quantity: 0),
    ShopItem(name: "Water", price: 5.00, quantity: 0)
]
