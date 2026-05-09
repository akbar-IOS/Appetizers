//
//  NutritionInfo.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 5/7/26.
//

import SwiftUI

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
            
        }
    }
}
#Preview {
    NutritionInfo(title: "Calories", value: 20)
}
