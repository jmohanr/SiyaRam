//
//  ContentViewModel.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import Firebase
import SwiftUI
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    private let service  = AuthService.shared
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    private var cancelable = Set<AnyCancellable>()
    
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancelable)
        
        service.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancelable)
    }
}
