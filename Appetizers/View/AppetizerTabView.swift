//
//  ContentView.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 3/26/26.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                }
        }
        .accentColor(Color(.green))
    }
}

#Preview {
    AppetizerTabView()
}
