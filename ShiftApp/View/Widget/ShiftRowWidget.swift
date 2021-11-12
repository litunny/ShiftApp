//
//  ShiftRowWigdet.swift
//  CoffeeShift
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct ShiftRowWidget: View {
    var body: some View {
        HStack(spacing : 20) {
            
            Button(action: {}) {
                
            }
            .frame(width: 50, height: 50)
            .background(Color.gray)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            
            VStack(alignment: .leading) {
                
                Text("John Doe")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("Waitress")
                    .font(.body)
            }
            
            Spacer()
            
            VStack(alignment:.trailing) {
                Text("9 - 12 PM")
                Text("FRI 4/10")
                    .fontWeight(.bold)
            }
            
        }.padding()
    }
}

struct ShiftRowWidget_Previews: PreviewProvider {
    static var previews: some View {
        ShiftRowWidget()
    }
}
