//
//  DateButtonWidget.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct DateButtonWidget: View {
    var title : String
    @ObservedObject var shiftData : ShiftViewModel
    
    var body: some View {
        Button(action: {
            shiftData.update(value: title)
        }, label: {
           Text(title)
            .fontWeight(.bold)
            .foregroundColor(shiftData.checkDate() == title ? .white : .gray)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
                shiftData.checkDate() == title ? Color("Color") : Color.gray
             )
            .cornerRadius(8)
        })
    }
}

struct DateButtonWidget_Previews: PreviewProvider {
    static var previews: some View {
        DateButtonWidget(title: "Today", shiftData: ShiftViewModel())
    }
}
