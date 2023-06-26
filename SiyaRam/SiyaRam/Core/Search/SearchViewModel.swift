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
    @Published var  searchdata: [User] = []
    @Published var itemsCount: Int = 0

    @Published var searchText: String = "" {
        didSet {
            if searchText.count > 0 {
                searchdata = searchdata.filter({$0.userName.contains(searchText)})
            } else {
                searchdata = allUsers
            }
        }
    }
    
    init() {
        Task {
          try await loadAllUsers()
        }
    }
   
    @MainActor
    func loadAllUsers() async throws {
        let users = try await UsersService.loadAllUsers()
        self.allUsers = users
        self.searchdata = users
        itemsCount = 1
        
    }
    
}
