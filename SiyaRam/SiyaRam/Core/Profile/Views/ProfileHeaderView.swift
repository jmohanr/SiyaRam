//
//  ProfileHeaderView.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var currentUser: User
    var profileStats: [ProfileStats] = [ProfileStats(stat: "Posts", values: "2"),
                                        ProfileStats(stat: "Followers", values: "10"),
                                        ProfileStats(stat: "Following", values: "0")]
    var body: some View {
        HStack {
            CircularImageView(imageUrl: currentUser.src)
            Spacer()
            statsView
        }.padding(.horizontal)
    }
    
    var statsView: some View {
        HStack(spacing: 15) {
            ForEach(profileStats) { index in
                VStack(spacing: 5) {
                    Text(index.values)
                        .foregroundColor(.blue)
                        .font(.subheadline)
                    Text(index.stat).font(.subheadline)
                }.fontDesign(.monospaced)
            }
        }
    }
    
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(currentUser: User(id: "", emailId: "", userName: ""))
    }
}
