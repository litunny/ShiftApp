//
//  CustomDatePicker.swift
//  CoffeeShift
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct CustomDatePicker : View {
    
    @State var date = Date()
    @State var data : DateType!
    @State var expanded = false
    @State var year = false
    
    var body : some View {
        GeometryReader { _ in
            VStack {
                if self.data != nil {
                    ZStack {
                        VStack(spacing: 15) {
                            
                            ZStack {
                                HStack {
                                    Spacer()
                                    Text(self.data.Month)
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                    Spacer()
                                    
                                }.padding(.vertical)
                                
                                HStack {
                                    Button(action: {}) {
                                        Image(systemName: "arrow.left")
                                            
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {}) {
                                        Image(systemName: "arrow.right")
                                          
                                    }
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            }
                            .background(Color.red)
                            
                            Text(self.data.Date)
                                .font(.system(size: 65))
                                .fontWeight(.bold)
                            
                            Text(self.data.Day)
                                .font(.title)
                            
                            Divider()
                            
                            Text(self.data.Year)
                                .font(.title)
                                .padding(.bottom, 12)
                            
                            if self.expanded {
                                Toggle(isOn: self.$year){
                                    Text("Year")
                                        .font(.title)
                                        .padding(.horizontal, 15)
                                }
                            }
                            
                        }
                        
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "arrow.left")
                                    
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "arrow.right")
                                  
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.5)
                    .background(Color.white)
                    .cornerRadius(15)
                }
            }
        }
        .background(Color.black.opacity(0.06))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.updateDate()
        }
    }
    
    func updateDate () {
        let current = Calendar.current
        
        let date = current.component(.day, from: self.date)
        let monthNO = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNO - 1]
        let year = current.component(.year, from: self.date)
        let weekno = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weekno - 1]
        
        self.data = DateType(Day: day, Date: "\(date)", Year: "\(year)", Month: month)
    }
}


struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
