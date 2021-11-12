//
//  CircleColorWidget.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct CircleColorWidget: View {
    @State var color : String
    var body: some View {
        Button(action: {}) {
            
        }
        .frame(width: 50, height: 50)
        .background(Color(color))
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct CircleColorWidget_Previews: PreviewProvider {
    static var previews: some View {
        CircleColorWidget(color: "Gray")
    }
}
