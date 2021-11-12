//
//  ShiftViewModel.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import Foundation

class ShiftViewModel: ObservableObject {
    @Published var name : String = ""
    @Published var date : Date = Date()
    @Published var isNewData = false
    
     
}
