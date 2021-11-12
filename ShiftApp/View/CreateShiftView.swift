//
//  CreateShiftView.swift
//  CoffeeShift
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct CreateShiftView: View {
    
    @ObservedObject var shiftData : ShiftViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Shift")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                 
            }.padding()
            
            HStack {
                Text("Employee")
                    .font(.title3)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal)
                
            ExpandedDropdown(isExpanded: false, selectedValue: $shiftData.employee.name, title: "Choose Employee", options: shiftData.employees)
            
            HStack {
                Text("Roles")
                    .font(.title3)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal)
            
            ExpandedDropdown(isExpanded: false, selectedValue: $shiftData.employee.role, title: "Choose Role", options: shiftData.roles)
            
            HStack {
                Text("Colors")
                    .font(.title3)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal)
       
            ExpandedDropdown(isExpanded: false, selectedValue: $shiftData.employee.color, title: "Choose Color", options: shiftData.colors)
            
            Spacer()
            
            Group{
                HStack {
                    Text("Time & Date")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
                
                HStack (spacing: 40) {
                    Text("Start Date")
                    DatePicker("", selection: $shiftData.employee.startDate)
                        .labelsHidden()
                }
                .padding(.horizontal)
                .padding(.vertical)
            
                HStack (spacing: 40) {
                    Text("End Date")
                    DatePicker("", selection: $shiftData.employee.endDate)
                        .labelsHidden()
                }
                .padding(.horizontal)
                .padding(.vertical)
            
                Button(action: { shiftData.writeData(context: context) }) {
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
                .disabled(shiftData.employee.isValid())
                .opacity(shiftData.employee.isValid() ? 0.5 : 1)
            }
        }
        .background(Color.black.opacity(0.06))
        .ignoresSafeArea(.all, edges: .bottom )
        .navigationTitle("Create Shift")
        .onAppear {
            shiftData.loadEmployees()
            shiftData.loadRoles()
            shiftData.loadColors()
        }
    }
}

struct CreateShiftView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShiftView(shiftData: ShiftViewModel())
    }
}
