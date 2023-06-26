//
//  ProfileView.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI

struct ProfileStats: Identifiable {
    var id = UUID().uuidString
    var stat: String
    var values: String
    
}

struct ProfileView: View {
    var currentUser: User
    @State var isPresentEditView = false
   
    var body: some View {
        NavigationStack {
            VStack {
                //Header View
                VStack(spacing:15) {
                    //Pic and stats
                    HStack {
                       ProfileHeaderView(currentUser: currentUser)
                    }.padding(.horizontal)
                    //Name and Bio
                BioEditDetailsView(currentUser: currentUser, isPresentEditView: $isPresentEditView)
                    Divider()
                    GridItemView(user: currentUser)
                }
            }
           
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if currentUser.isCurrentUser {
                        Button {
                            AuthService.shared.logoutUser()
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(currentUser: User(id: "", emailId: "", userName: "Jagan"))
    }
}


