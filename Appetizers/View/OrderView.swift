//
//  OrderView.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 3/26/26.
//

import SwiftUI

struct OrderView: View {
    
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack{
                    List {
                        ForEach(order.items){appetizer in
                         AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: {indexSet in
                            order.items.remove(atOffsets:indexSet)
                        })
                     }
                    .listStyle(PlainListStyle())
                     
                     Button{
                         
                     }label: {
                         APButton(title: "\(order.total(), specifier: "%.2f") place order")
                     }
                     .padding(.bottom, 25)
                }
                
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order",
                               message: "Your order for now is empty, \nplease add appetizer")
                }
            }
            .navigationTitle("Orders")
        }
        
        
        
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
