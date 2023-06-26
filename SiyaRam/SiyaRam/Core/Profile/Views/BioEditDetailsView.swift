//
//  BioEditDetailsView.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import SwiftUI

struct BioEditDetailsView: View {
    var currentUser: User
    @Binding var isPresentEditView: Bool
    var body: some View {
        biDataView
        editProfileButton
    }
    
    var biDataView: some View {
        VStack (alignment: .leading,spacing: 5){
            if let name = currentUser.userName {
                Text(name)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            if let bio = currentUser.bioData {
                Text(bio)
            }
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
    }
    var editProfileButton: some View {
        Button {
            isPresentEditView = currentUser.isCurrentUser
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(currentUser.isCurrentUser ? Color.black:Color.blue,lineWidth: 1)
                .frame(maxHeight: 40)
                .overlay {
                    Text(currentUser.isCurrentUser ? "Edit Profile" : "Follow")
                        .foregroundColor(currentUser.isCurrentUser ? .black:.blue)
                }
        }.padding(.horizontal)
            .fullScreenCover(isPresented: $isPresentEditView) {
                EditProfileView(user: currentUser)
            }
    }
}

struct BioEditDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BioEditDetailsView(currentUser: User(id: "", emailId: "", userName: ""), isPresentEditView: .constant(false))
    }
}
