//
//  CreateShiftView.swift
//  CoffeeShift
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct CreateShiftView: View {
    
    @ObservedObject var homeData : ShiftViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Shift")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                 
            }.padding()
            
            TextEditor(text: $homeData.name)
                .padding()
                .frame(height: 56)
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            Spacer(minLength: 0)
        }
        .navigationTitle("Create Shift")
    }
}

struct CreateShiftView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShiftView(homeData: ShiftViewModel())
    }
}
