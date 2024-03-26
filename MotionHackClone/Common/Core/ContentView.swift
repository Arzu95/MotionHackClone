//
//  ContentView.swift
//  MotionHackClone
//
//  Created by Muhammad Arzu on 24/03/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isAuthenticated") var isAuthenticated = false
    var body: some View {
        ZStack {
            if isAuthenticated {
                SalesDataView()
            } else {
                AuthenticationView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
