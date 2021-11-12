//
//  ContentView.swift
//  ShiftApp
//
//  Created by Itunu on 12/11/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
            ShiftView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
