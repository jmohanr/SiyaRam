//
//  FeedHeader.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI
import Kingfisher


struct FeedHeader: View {
    var post: Post
    var body: some View {
        HStack {
            if let user = post.user, let img = user.src {
                KFImage(URL(string: img))
                    .resizable()
                    .frame(maxWidth: 50,maxHeight: 50)
                    .clipShape(Circle())
            }
            if let name = post.user?.userName {
                Text(name).font(.headline)
            }
            Spacer()
        }.padding(.horizontal)
    }
}

struct FeedHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeader(post: Post(id: "", src: "", title: "", srcType: .Image))
    }
}
