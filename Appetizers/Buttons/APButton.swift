//
//  APButton.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 5/7/26.
//

import SwiftUI

struct APButton: View {
   
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 260 , height: 50)
            .foregroundStyle(.white)
            .background(.green)
            .cornerRadius(12)
    }
}

#Preview {
    APButton(title: "Test Title")
}
