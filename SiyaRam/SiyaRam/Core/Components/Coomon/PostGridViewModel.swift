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
    
    init(user: User) {
        self.user = user
        Task {
            try await fethUserPosts()
        }
    }
    
    @MainActor
    func fethUserPosts() async throws {
        self.feeds = try await PostsService.fetchCurrentUserPosts(withuid: self.user.id )
        for i in 0..<self.feeds.count {
            feeds[i].user = self.user
        }
    }
    
}
