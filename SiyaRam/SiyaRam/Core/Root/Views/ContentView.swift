//
//  ContentView.swift
//  SiyaRam
//
//  Created by Kaplan2 on 25/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
               
            } else {
                if let currentuser = viewModel.currentUser {
                    MainTabView(currentUser: currentuser)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
