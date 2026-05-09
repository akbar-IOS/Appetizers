//
//  AppetizersListModelView.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 4/18/26.
//

import Foundation
import Combine

final class AppetizersListModelView: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isShowingDetail = false
    @Published var selctedAppetizer: Appetizer?
    
    func getAppetizer(){
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    case .failure(let error):
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponce
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.invalidToComplate
                    }
                    
                }
            }
        }
    }
}
