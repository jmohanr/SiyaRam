//
//  FeedsViewModel.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import Foundation
import Firebase

class FeedsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    static let fireStorePath = Firestore.firestore().collection(DBKeys.likes.rawValue)
    @Published var itemsCount: Int = 0
    @Published var dataCount: Int = 1
    /*
    init() {
        Task {
            try await fetchPosts()
        }
    }
    */
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostsService.fetchPosts()
        itemsCount = 1
    }
    
    @MainActor
    func updateFeedLikes(count: Int,isLiked: Bool,postId: String) async throws {
        guard let uId = Auth.auth().currentUser?.uid else { return}
        let path = FeedsViewModel.fireStorePath.document()
        let likes = Likes(id: path.documentID, postId: postId, likesCount: count, ownerId: uId, isLiked: isLiked)
        guard let encodeLike = try? Firestore.Encoder().encode(likes) else {return}
        try await path.setData(encodeLike)
        dataCount = posts.count
    }
}

//order(by: "time")
