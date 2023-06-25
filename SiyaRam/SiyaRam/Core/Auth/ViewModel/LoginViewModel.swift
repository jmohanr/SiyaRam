//
//  LoginViewModel.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login()  async throws {
        try? await AuthService.shared.loginUser(email: email, password: password)
        resetData()
    }
    
    func resetData() {
        email = ""
        password = ""
    }
}
