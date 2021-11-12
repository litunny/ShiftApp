//
//  ShiftViewModel.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import Foundation
import CoreData

class ShiftViewModel: ObservableObject {
    @Published var employee : Employee = Employee()
    
    
    @Published var isNewData = false
    
    @Published var colors : [String] = []
    @Published var roles : [String] = []
    @Published var employees : [String] = []
    
    //@Published var date : Date = Date()
    //@Published var name : String = ""
    //@Published var selectedRole : String = ""
    //@Published var selectedColor : String = ""
    
    let calendar = Calendar.current
    
    func checkDate () -> String {
        if calendar.isDateInToday(employee.startDate) {
            return "Today"
        } else if calendar.isDateInTomorrow(employee.startDate)  {
            return "Tomorrow "
        } else {
            return "Other Day"
        }
    }
    
    func update(value : String) {
        if value == "Today" {
            employee.startDate = Date()
        } else if value == "Tomorrow" {
            employee.startDate = calendar.date(byAdding: .day, value: 1, to: Date())!
        } else {
            
        }
    }
    
    func writeData(context : NSManagedObjectContext) {
        let newShift  = Shift(context: context)
        newShift.date = employee.startDate
        newShift.name = employee.name
        newShift.role = employee.role
        newShift.color = employee.color
        
        do {
            try context.save()
            isNewData.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadEmployees() {
        employees = ["Michael", "Cameron", "Ethan", "Simon", "Jake"]
    }
    
    func loadRoles() {
        roles = ["Waitress", "Prep", "Cook", "Infront of Door"]
    }
    
    func loadColors () {
        colors = ["Red", "Yellow", "Blue", "Green", "Black", "Gray", "Pink", "Orange"]
    }
}
