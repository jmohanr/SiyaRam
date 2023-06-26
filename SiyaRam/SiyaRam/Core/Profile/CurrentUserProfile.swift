//
//  CurrentUserProfile.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import Kingfisher

struct CurrentUserProfile: View {
    var currentUser: User
    @State var isPresentEditView = false

   
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing:15) {
                    HStack {
                       ProfileHeaderView(currentUser: currentUser)
                    }.padding(.horizontal)
                    
                   BioEditDetailsView(currentUser: currentUser, isPresentEditView: $isPresentEditView)
                    Divider()
                    GridItemView(user: currentUser)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
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

struct CurrentUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfile(currentUser: User(id: "", emailId: "", userName: "Jagan"))
    }
}

