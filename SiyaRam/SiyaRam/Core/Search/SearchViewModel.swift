//
//  SearchViewModel.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var allUsers: [User] = []
    
    init() {
        Task {
          try await loadAllUsers()
        }
    }
    
    @MainActor
    func loadAllUsers() async throws {
        var users = try await UsersService.loadAllUsers()
        self.allUsers = users
        
    }
    
}
