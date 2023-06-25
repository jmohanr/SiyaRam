//
//  FeedBody.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI


enum SocialType {
    case LIKE
    case COMMENT
    case SHARE
}

struct FeedBody: View {
    var feedData: FeedData
    let imageDimension = UIScreen.screenWidth

    
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Image(feedData.src)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: imageDimension,maxHeight: imageDimension,alignment: .center)
                .clipped()
                .cornerRadius(10)
                .shadow(color: .black, radius: 20)
                .rotationEffect(.degrees(-3))
              
            HStack(spacing: 15) {
                SocialView(name: feedData.isLiked ?? false ? "heart.fill":"heart", tintColor: feedData.isLiked ?? false ? .pink:.black,type: .LIKE)
                SocialView(name: "bubble.right", tintColor: .black,type: .COMMENT)
                SocialView(name: "paperplane", tintColor: .black,type: .SHARE)
                Spacer()
            }
            .tint(.black)
            VStack(alignment: .leading,spacing: 15) {
                Text(feedData.likesCount ?? 0>0 ? "\(feedData.likesCount ?? 0) Likes": "").isHidden(feedData.likesCount ?? 0 > 0 ? false:true,remove: feedData.likesCount ?? 0 > 0 ? false:true)
                Text(feedData.feedDescription)
             
            }
        }.padding(.horizontal,5)
       
    }
    
    
}

struct FeedBody_Previews: PreviewProvider {
    static var previews: some View {
        FeedBody(feedData: FeedData(id: "",src: "3", userName: "Hanuman", srcType: .Image, isLiked: true, likesCount: 3, feedDescription: "Hello, World!"))
    }
}

struct SocialView: View {
    @State var name: String = ""
    @State var tintColor: Color = .black
    @State var type: SocialType = .LIKE
    
    var body: some View {
        Button {} label: {
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 30,maxHeight: 30)
                .tint(tintColor)
        }
    }
}

extension View {
    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
