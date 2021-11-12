//
//  ShiftView.swift
//  CoffeeShift
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct ShiftView: View {
    
    @StateObject var shiftData = ShiftViewModel()
    
    @FetchRequest(entity: Shift.entity(), sortDescriptors: [NSSortDescriptor(key : "dateCreated", ascending: false)], animation: .spring()) var results : FetchedResults<Shift>
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 20, content: {
                        ForEach(results) { result in
                            ShiftRowWidget(shift: result)
                            Divider()
                        }
                        .contextMenu {
                            Button(action : { }) {
                                Text("Edit")
                            }
                            
                            Button(action : { }) {
                                Text("Delete")
                            }
                        }
                    })
                })
                .padding()
            }
            
            Button(action: { shiftData.isNewData.toggle() }) {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("Color"))
                    .clipShape(Circle())
            }.padding()
        })
        .navigationTitle("Shift")
        .toolbar {
            Button(action: {
                shiftData.isNewData.toggle()
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $shiftData.isNewData, content: {
             CreateShiftView(shiftData: shiftData)
        })
        
//        ScrollView {
//            VStack {
//                ForEach(0..<50) {_ in
//                    ShiftRowWidget()
//                    Divider()
//                }
//            }
//        }
//        .navigationTitle("Shift")
//        .toolbar {
//            Button(action: {
//                shiftData.isNewData.toggle()
//            }) {
//               Image(systemName: "plus")
//            }
//        }.sheet(isPresented: $shiftData.isNewData, content: {
//            CreateShiftView(shiftData: shiftData)
//        })
    
    }
}

struct ShiftView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftView()
    }
}
