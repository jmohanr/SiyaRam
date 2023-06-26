//
//  FeedHeader.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI
import Kingfisher
struct FeedHead {
    var src: String
    var name: String
}

struct FeedHeader: View {
    var feedHead: FeedHead
    
    var body: some View {
        HStack {
            if let img = feedHead.src {
                KFImage(URL(string: img))
                    .resizable()
                    .frame(maxWidth: 50,maxHeight: 50)
                    .clipShape(Circle())
            }
            Text(feedHead.name).fontWeight(.black)
            Spacer()
        }.padding(.horizontal)
    }
}

struct FeedHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeader(feedHead: FeedHead(src: "", name: "") )
    }
}
