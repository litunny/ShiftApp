//
//  ExpandedDropdown.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI

struct ExpandedDropdown: View {
    @State var isExpanded = true
    @Binding var selectedValue : String
    @State var title : String
    var employees : [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            DisclosureGroup(selectedValue , isExpanded: $isExpanded) {
                ScrollView(.vertical, showsIndicators: true){
                    VStack {
                        ForEach(employees, id: \.self) { value in
                            Text("\(value)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedValue = value
                                    withAnimation {
                                        self.isExpanded.toggle()
                                    }
                                }
                        }
                    }
                }
                .frame(height : 250)
            }
            .accentColor(.white)
            .font(.title3)
            .foregroundColor(.white)
            .padding(.all)
            .background(Color("Color"))
            .cornerRadius(8)
        }.padding(.all)
    }
}

struct ExpandedDropdown_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedDropdown(selectedValue: .constant(""), title: "Choose Employee", employees: ["Anna", "Jane", "Williams", "Shawn", "Alisha", "Kimberly"])
    }
}
