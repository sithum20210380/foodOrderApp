//
//  CartView.swift
//  foodOrderApp
//
//  Created by Sithum Raveesha on 2024-11-12.
//

import SwiftUI

struct CartView: View {
    
    @Binding var purchasedItems: [ShopItem]
    @State var total: Double = 0
    @AppStorage("previousDeal") var previousDeal: Double = 0
    
    var body: some View {
        NavigationStack {
            VStack {
               Text("My Cart")
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading) {
                    if (total > 0) {
                        List {
                            Section {
                                Text ("Purchased Items")
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                ForEach(purchasedItems) { item in
                                    if (item.quantity > 0) {
                                        HStack {
                                            Text(item.name)
                                                .font(.headline)
                                            Spacer()
                                            Text ("\(calculatePurchasedItems(item: item), specifier: "%.2f")")
                                                .font(.headline)
                                        }
                                    }
                                }
                            }
                            Section {
                                    Text("Payment Details")
                                        .font(.headline)
                                        .foregroundStyle(.secondary)
                                    HStack {
                                        Text("Net Amount")
                                            .font(.headline)
                                        Spacer()
                                        Text("\(total, specifier: "%.2f")")
                                            .font(.headline)
                                    }
                            }
                        }
                        .padding()
                        .listStyle(.plain)
                    }else {
                        Text("Your cart is empty")
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Cart")
        }
        Text ("Your previous Deal with us was $\(previousDeal, specifier: "%.2f")")
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.vertical, 20)
            .padding(.horizontal, 25)
            .background(Color.green)
            .cornerRadius(5)
        .onAppear {
            calculateTotal()
            previousDeal = UserDefaults.standard.double(forKey: "previousDeal")
        }
        .onDisappear {
            UserDefaults.standard.set(total, forKey: "previousDeal")
        }
    }
    
    func calculatePurchasedItems(item: ShopItem) -> Double {
        return item.price * Double(item.quantity)
    }
    
    func calculateTotal() {
        for item in purchasedItems {
            total += calculatePurchasedItems(item: item)
        }
    }
    
}

#Preview {
    CartView(purchasedItems: .constant(shopItems))
}
