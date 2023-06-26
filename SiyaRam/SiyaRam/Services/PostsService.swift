//
//  PostsService.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import Foundation
import Firebase

class PostsService {
    private static let fireStorePath = Firestore.firestore().collection(DBKeys.posts.rawValue)
    
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await fireStorePath.order(by: "time", descending: true).getDocuments()
        var feeds = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        for i in 0..<feeds.count {
            guard let ownerId = feeds[i].ownerId else { return feeds}
            let postUser = try await UsersService.fetchUser(withuID: ownerId)
            let likes = try await self.fetchPostLikes(postId: feeds[i].id)
            feeds[i].user = postUser
            if likes.count > 0 {
                feeds[i].likes = likes[0]
            }
        }
        return feeds
    }
    
    
    static func fetchCurrentUserPosts(withuid uId: String) async throws -> [Post] {
        
        let shot = try await fireStorePath.whereField("ownerId", isEqualTo: uId).getDocuments()
        return try shot.documents.compactMap({try $0.data(as: Post.self)})
    }
    
    @MainActor
   static func fetchPostLikes(postId: String) async throws -> [Likes] {
        let shot = try await FeedsViewModel.fireStorePath.whereField("postId", isEqualTo: postId).getDocuments()
        return try shot.documents.compactMap({try $0.data(as: Likes.self)})
    }
}
