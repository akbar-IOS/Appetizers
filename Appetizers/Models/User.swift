//
//  User.swift
//  Appetizers
//
//  Created by Akbar Abdullo on 5/8/26.
//

import Foundation

struct User: Codable{
     var firstName = ""
     var lastName = ""
     var email = ""
     var birthdate = Date()
     var extraNapkins = false
     var frequentRefills = false
}
