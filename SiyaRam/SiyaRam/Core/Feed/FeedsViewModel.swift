//
//  FeedsViewModel.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import Foundation
import Firebase

class FeedsViewModel: ObservableObject {
    @Published var feeds: [FeedData] = []
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    @MainActor
    func fetchPosts() async throws {
        self.feeds = try await PostsService.fetchPosts()
    }
    
}
