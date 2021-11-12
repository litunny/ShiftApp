//
//  ShiftView.swift
//  CoffeeShift
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct ShiftView: View {
    
    @StateObject var shiftData = ShiftViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<50) {_ in
                    ShiftRowWidget()
                    Divider()
                }
            }
        }
        .navigationTitle("Shift")
        .toolbar {
            Button(action: {
                shiftData.isNewData.toggle()
            }) {
               Image(systemName: "plus")
            }
        }.sheet(isPresented: $shiftData.isNewData, content: {
            CreateShiftView(shiftData: shiftData)
        })
    
    }
}

struct ShiftView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftView()
    }
}
