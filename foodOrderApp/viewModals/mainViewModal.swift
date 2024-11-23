//
//  shopItemViewModal.swift
//  foodOrderApp
//
//  Created by Sithum Raveesha on 2024-11-14.
//

import Foundation

final class mainViewModal: ObservableObject {
    
    @Published var shopItems = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    
    @Published var showCartView = false
    
    func increaseQuantity(for item: ShopItem) {
        let selectedItem = shopItems.first(where: {$0.name == item.name })!
        if selectedItem.quantity < 10 {
            selectedItem.quantity += 1
            shopItems = shopItems
        }
        var newItems: [ShopItem] = []
        shopItems.forEach {
            if $0.name == selectedItem.name {
                newItems.append(selectedItem)
            }else {
                newItems.append($0)
            }
        }
        shopItems = newItems
    }
    
    func decreaseQuantity(for item: ShopItem) {
        let selecteditem = shopItems.first(where: { $0.name == item.name})!
        if selecteditem.quantity > 0 {
            selecteditem.quantity -= 1
            shopItems = shopItems
        }
        
        var newItems: [ShopItem] = []
        shopItems.forEach {
            if $0.name == selecteditem.name {
                newItems.append(selecteditem)
            }else {
                newItems.append($0)
            }
        }
        shopItems = newItems
    }
}
