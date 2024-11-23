//
//  ContentView.swift
//  foodOrderApp
//
//  Created by Sithum Raveesha on 2024-11-12.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject private var viewModal = mainViewModal()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                List(viewModal.shopItems) { item in
                    HStack {
                        Image(item.name.lowercased())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack (alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text("\(item.price, specifier: "%.2f")")
                        }
                        Spacer()
                        Stepper {
                            
                        }onIncrement: {
                            viewModal.increaseQuantity(for: item)
                        }onDecrement: {
                            viewModal.decreaseQuantity(for: item)
                        }
                        Text("\(item.quantity)")
                    }
                    
                }
                .listStyle(.plain)
                
                Spacer()
                
                Button{
                    viewModal.showCartView.toggle()
                }label: {
                    Text("Checkout")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.vertical,10)
                        .padding(.horizontal,20)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationDestination(isPresented: $viewModal.showCartView) {
                CartView(purchasedItems: $viewModal.shopItems)
            }
            .navigationTitle("Buy fresh Groceries")
        }
    }
}

#Preview {
    ContentView()
}
