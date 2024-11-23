//
//  cartViewModal.swift
//  foodOrderApp
//
//  Created by Sithum Raveesha on 2024-11-14.
//

import SwiftUI

final class cartViewModal: ObservableObject {
    
    @Published var purchasedItems: [ShopItem] = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    @Published var total: Double = 0
    @AppStorage("previousDeal") var previousDeal: Double = 0
    
    func calculatePurchasedItems(item: ShopItem) -> Double {
        return item.price * Double(item.quantity)
    }
    
    func calculateTotal() {
        for item in purchasedItems {
            total += calculatePurchasedItems(item: item)
        }
    }
}
