//
//  Alert.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 4/23/26.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id: UUID = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {
    
    //MARK: - Network Alert
    static let invalidData = AlertItem(title: Text("Invalid Data"), message: Text("Please check your input."), dismissButton: .default(Text("Got it!")))
    
    static let invalidResponce = AlertItem(title: Text("Invalid Response"), message: Text("Invalid responce from the server"), dismissButton: .default(Text("Got it!")))
    
    static let invalidURL = AlertItem(title: Text("Invalid URL "), message: Text("There was an issue connecting to the server"), dismissButton: .default(Text("Got it!")))
    
    static let invalidToComplate = AlertItem(title: Text("Invalid Complate"), message: Text("Please Chek your internet connection"), dismissButton: .default(Text("Got it!")))
    
     //MARK: - Account Alert
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form have been filled out"), dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please ensure your email is correct"), dismissButton: .default(Text("Ok")))
    
    static let userSavedSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your profile has been saved successfully"), dismissButton: .default(Text("Ok")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"), message: Text("There was an error saving your profile. Please try again"), dismissButton: .default(Text("Ok")))

}
