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
            
            TextField("Full Name", text: $homeData.name)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            Spacer(minLength: 0)
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack (spacing: 40) {
                DateButtonWidget(title: "Today", shiftData: homeData)
                //DateButtonWidget(title: "Tomorrow", shiftData: homeData)
                DatePicker("", selection: $homeData.date)
                    .labelsHidden()
            }.padding()
        
            
            Button(action: {}) {
                 Label(
                    title : {
                        Text("Add Now")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    },
                    icon: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                 )
                 .padding(.vertical)
                 .frame(width: UIScreen.main.bounds.width - 30 )
                 .background(Color("Color"))
                 .cornerRadius(8)
            }
            .padding(.bottom, 40)
        }
        .background(Color.black.opacity(0.06))
        .ignoresSafeArea(.all, edges: .bottom )
        .navigationTitle("Create Shift")
    }
}

struct CreateShiftView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShiftView(homeData: ShiftViewModel())
    }
}
