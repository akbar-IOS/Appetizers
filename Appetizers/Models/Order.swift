//
//  Order.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 5/9/26.
//

import Foundation
import SwiftUI
import Combine

final class Order: ObservableObject{
    @Published var items: [Appetizer] = []
    
    func total() -> Double {
        items.reduce(0) { $0 + $1.price }
    }
}
