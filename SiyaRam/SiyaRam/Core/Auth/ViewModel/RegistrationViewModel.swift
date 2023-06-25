//
//  RegistrationViewModel.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import Firebase
import SwiftUI

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var userName = ""
    
    
    func createUser() async throws {
        try? await AuthService.shared.createUser(email: email, password: password, userName: userName)
        resetData()
    }
    
    func resetData() {
        email = ""
        password = ""
        userName = ""
    }
}
