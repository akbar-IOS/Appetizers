//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 4/14/26.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: Mocdata.sampleAppetizer)
}
