//
//  AccountView.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 3/26/26.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountModelView()
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Personal Info")) {
                    TextField("Firs Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birhtdate", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
            }
            .navigationTitle("Account")
                
        }
        .onAppear(perform: viewModel.retrieveUser) 
        .alert(item: $viewModel.alertItem ){ alertitem in
            Alert(title: alertitem.title,
                  message: alertitem.message,
                  dismissButton: alertitem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
