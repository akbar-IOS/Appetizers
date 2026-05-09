//
//  AppetizerModel.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 4/16/26.
//

import Foundation

nonisolated struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

nonisolated struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct Mocdata{
   static let sampleAppetizer = Appetizer(id: 1,
                                           name: "Test Appetizer",
                                           description: "This is a test appetizer and it's going to be great",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 78,
                                           carbs: 85)
    
    static let sampleAppetizerOne = Appetizer(id: 001,
                                            name: "Test Appetizer One",
                                            description: "This is a test appetizer and it's going to be great",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 78,
                                            carbs: 85)
    
    static let sampleAppetizerTwo = Appetizer(id: 002,
                                            name: "Test Appetizer Two",
                                            description: "This is a test appetizer and it's going to be great",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 78,
                                            carbs: 85)
    
    static let sampleAppetizerThree = Appetizer(id: 003,
                                            name: "Test Appetizer Three",
                                            description: "This is a test appetizer and it's going to be great",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 78,
                                            carbs: 85)
    
    
    static let orderItems = [sampleAppetizerOne,sampleAppetizerTwo,sampleAppetizerThree]
    
    static let appetizers  = [sampleAppetizer , sampleAppetizer , sampleAppetizer]
}
