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
    var profileStats: [ProfileStats] = [ProfileStats(stat: "Posts", values: "2"),
                                        ProfileStats(stat: "Followers", values: "10"),
                                        ProfileStats(stat: "Following", values: "0")]
    var body: some View {
        NavigationStack {
            VStack {
                //Header View
                VStack(spacing:15) {
                    //Pic and stats
                    HStack {
                        profileImage
                        Spacer()
                        statsView
                    }.padding(.horizontal)
                    //Name and Bio
                    biDataView
                    //Edit Profile button
                    editProfileButton
                   
                    Divider()
                    GridItemView()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if currentUser.isCurrentUser {
                        Button {
                            isPresentEditView.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isPresentEditView) {
            Text("Edit Profile")
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(currentUser: User(id: "", emailId: "", userName: "Jagan"))
    }
}

extension ProfileView {
    
    var statsView: some View {
        HStack(spacing: 10) {
            ForEach(profileStats) { index in
                VStack(spacing: 5) {
                    Text(index.values)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    Text(index.stat).fontWeight(.semibold)
                }.fontDesign(.monospaced)
            }
        }
    }
    
    var profileImage: some View {
        VStack {
            if let src = currentUser.src {
                Image(src)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 70,maxHeight: 70)
                    .clipShape(Circle())
            }
        }
        
    }
    var biDataView: some View {
        VStack (alignment: .leading,spacing: 5){
            if let name = currentUser.userName {
                Text(name)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            if let bio = currentUser.biodata {
                Text(bio)
            }
            
        }.frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
    }
    var editProfileButton: some View {
        Button {
           
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(currentUser.isCurrentUser ? Color.black:Color.blue,lineWidth: 1)
                .frame(maxHeight: 40)
                .overlay {
                    Text(currentUser.isCurrentUser ? "Edit Profile" : "Follow")
                        .foregroundColor(currentUser.isCurrentUser ? .black:.blue)
                }
        }.padding(.horizontal)
    }
}