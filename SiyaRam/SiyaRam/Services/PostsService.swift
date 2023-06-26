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
    static func fetchPosts() async throws -> [FeedData] {
        let snapshot = try await fireStorePath.getDocuments()
        var feeds = try snapshot.documents.compactMap({try $0.data(as: FeedData.self)})
        for i in 0..<feeds.count {
            guard let ownerId = feeds[i].ownerId else { return feeds}
            let postUser = try await UsersService.fetchUser(withuID: ownerId)
            feeds[i].user = postUser
        }
        return feeds
    }
    
    static func fetchCurrentUserPosts(withuid uId: String) async throws -> [FeedData] {
        let shot = try await fireStorePath.whereField("ownerId", isEqualTo: uId).getDocuments()
        return try shot.documents.compactMap({try $0.data(as: FeedData.self)})
    }
}
