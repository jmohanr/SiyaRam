//
//  PostGridViewModel.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import Foundation
import Firebase

class PostGridViewModel: ObservableObject {
    @Published var user: User
    @Published var feeds: [Post] = []
    
    @Published var itemsCount: Int = 0
    init(user: User) {
        self.user = user
        Task {
            try await fethUserPosts()
        }
    }
    
    @MainActor
    func fethUserPosts() async throws {
        var posts = try await PostsService.fetchCurrentUserPosts(withuid: self.user.id )
        for i in 0..<posts.count {
            posts[i].user = self.user
        }
        self.feeds = posts.filter({$0.srcType != .Text})
        itemsCount = 1
    }
    
}
