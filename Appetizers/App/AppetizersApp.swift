//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 3/26/26.
//

import SwiftUI
import Combine

@main
struct AppetizersApp: App {
    
   @StateObject private var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
