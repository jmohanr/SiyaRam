//
//  AuthService.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import Firebase
import SwiftUI
import Combine
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var users: [User] = []

    static let shared = AuthService()
    
    private init() {
        Task {
            try? await loadUser()
        }
        
    }
    @MainActor
    func loginUser(email: String, password: String) async throws {
        do {
            let user = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = user.user
            try? await loadUser()
            
        }catch {
            print("DEBUG: Login User Error\(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(email: String, password: String,userName: String) async throws {
        do {
            let user = try await Auth.auth().createUser(withEmail: email, password: password)
            await uploadUserData(id: user.user.uid, email: email, userName: userName)
            self.userSession = user.user
        } catch {
            print("DEBUG: Create user Error\(error.localizedDescription)")

        }
}
    @MainActor
    func uploadUserData(id: String,email: String, userName: String) async {
        let user = User(id: id, emailId: email, userName: userName)
        guard let encodeUser =  try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection(DBKeys.users.rawValue).document(user.id).setData(encodeUser)
    }
    
    @MainActor
    func loadUser() async throws {
        self.userSession = Auth.auth().currentUser
        guard let userId = userSession?.uid else {return}
        let shot = try? await Firestore.firestore().collection(DBKeys.users.rawValue).document(userId).getDocument()
        self.currentUser = try? shot?.data(as: User.self)
       
    }
    
   
    
    
    
    func logoutUser()  {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser  = nil
        } catch {
            
        }
    }
}
