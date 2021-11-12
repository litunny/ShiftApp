//
//  ShiftViewModel.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import Foundation
import CoreData

class ShiftViewModel: ObservableObject {
    @Published var name : String = ""
    @Published var date : Date = Date()
    @Published var isNewData = false
    
    @Published var colors : [String] = []
    @Published var roles : [String] = []
    @Published var employees : [String] = []
    
    @Published var selectedRole : String = ""
    
    let calendar = Calendar.current
    
    func checkDate () -> String {
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date)  {
            return "Tomorrow "
        } else {
            return "Other Day"
        }
    }
    
    func update(value : String) {
        if value == "Today" {
             date = Date()
        } else if value == "Tomorrow" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        } else {
            
        }
    }
    
    func writeData(context : NSManagedObjectContext) {
        let newShift  = Shift(context: context)
        newShift.date = date
        newShift.name = name
        newShift.role = selectedRole
        
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
        colors = ["Red", "Yellow", "Blue", "Green", "Black", "Gray", "PinK"]
    }
}
