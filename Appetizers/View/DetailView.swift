//
//  DetailView.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 5/4/26.
//

import SwiftUI

struct DetailView: View {
   
    let appetizers: Appetizer
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizers.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 215)
            
            VStack(spacing: 20){
                Text(appetizers.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(appetizers.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(10)
            
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizers.calories)
                    NutritionInfo(title: "Carbs", value: appetizers.carbs)
                    NutritionInfo(title: "Protein", value: appetizers.protein)
                }
            }
            
            Spacer()
            
            Button{
                order.items.append(appetizers)
                isShowingDetail = false
            }label: {
                APButton(title: "$\(appetizers.price, specifier: "%.2f") - add to order")
                
            }
            .padding(.bottom, 40)
        }
        .frame(width: 300, height: 525)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        }label: {
           XDismissButton()
        } , alignment: .topTrailing)
    }
}

#Preview {
    DetailView(appetizers: Mocdata.sampleAppetizer , isShowingDetail: .constant(true))
}

