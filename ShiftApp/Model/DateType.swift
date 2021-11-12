//
//  DateType.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import Foundation

struct DateType {
    var Day : String
    var Date : String
    var Year : String
    var Month : String
}

struct CustomColor : Identifiable {
    let id = UUID()
    var name : String
}

class Employee {
    var name : String
    var color: String
    var role : String
    var startDate : Date
    var endDate : Date
    
    init() {
        name = ""
        color = ""
        role = ""
        startDate = Date()
        endDate = Date()
    }
    
    func isValid() -> Bool {
        return !name.isEmpty && !color.isEmpty && !role.isEmpty
    }
}

