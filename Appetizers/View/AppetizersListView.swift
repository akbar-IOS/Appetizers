//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 3/26/26.
//

import SwiftUI

struct AppetizersListView: View {
  
    @StateObject var viewModel = AppetizersListModelView()
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture{
                            viewModel.selctedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("Appetizers")
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                DetailView(appetizers: viewModel.selctedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .onAppear {
            viewModel.getAppetizer()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
}

#Preview {
    AppetizersListView()
}
