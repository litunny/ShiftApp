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
    
    let calendar = Calendar.current

    func writeData(context : NSManagedObjectContext) {
        let newShift  = Shift(context: context)
        newShift.startDate = employee.startDate
        newShift.endDate = employee.endDate
        newShift.name = employee.name
        newShift.role = employee.role
        newShift.color = employee.color
        newShift.dateCreated = Date()
        
        do {
            try context.save()
            isNewData.toggle()
            employee.clear()
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
