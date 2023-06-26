//
//  FeedBody.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI
import Kingfisher


enum SocialType {
    case LIKE
    case COMMENT
    case SHARE
    case SAVE
}

struct FeedBody: View {
    var feedData: Post
    let imageDimension = UIScreen.screenWidth
  
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            if let img = feedData.src,img.count > 0 {
                KFImage(URL(string: img))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: imageDimension,maxHeight: imageDimension,alignment: .center)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 20)
                    .rotationEffect(.degrees(-3))
            }
            
            HStack(spacing: 15) {
                SocialView(name: feedData.likes?.isLiked ?? false ? "heart.fill":"heart", tintColor: feedData.likes?.isLiked ?? false ? .pink:.black,type: .LIKE,feedData: feedData)
                SocialView(name: "bubble.right", tintColor: .black,type: .COMMENT,feedData: feedData)
                SocialView(name: "paperplane", tintColor: .black,type: .SHARE,feedData: feedData)
                Spacer()
            }
            .tint(.black)
            VStack(alignment: .leading,spacing: 15) {
                if let likes = feedData.likes, likes.likesCount > 0 {
                    Text("\(likes.likesCount) Likes")
                }
                if let desc = feedData.feedDescription {
                    Text(desc)
                }
            }
        }.padding(.horizontal,5)
        
    }
}

struct FeedBody_Previews: PreviewProvider {
    static var previews: some View {
        FeedBody(feedData: Post(id: "",src: "", title: "", srcType: .Image, isLiked: true, likesCount: 0, feedDescription: ""))
    }
}

struct SocialView: View {
    @State var name: String = ""
    @State var tintColor: Color = .black
    @State var type: SocialType = .LIKE
    var feedData: Post
    
    @StateObject var viewModel = FeedsViewModel()
    var body: some View {
        Button {
            switch type {
            case.LIKE:
                Task{
                    try await viewModel.updateFeedLikes(count:1,isLiked:true,postId:feedData.id)
                }
            default:break;
            }
        } label: {
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 30,maxHeight: 30)
                .tint(tintColor)
        }
    }
}

