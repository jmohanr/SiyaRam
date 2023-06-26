//
//  MainTabView.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var currentUser: User
    var body: some View {
        
        TabView(selection: $selectedIndex) {
            FeedCell()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                Image(systemName: "house")
                }.tag(0)
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
            UploadPostView(currentUser: currentUser, selectedIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                Image(systemName: "plus.circle")
            }.tag(2)
            Text("Notifications")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            CurrentUserProfile(currentUser: currentUser)
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                Image(systemName: "person")
            }.tag(4)
        }.tint(Color("tabSelector"))
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(currentUser: User(id: "", emailId: "", userName: ""))
    }
}
