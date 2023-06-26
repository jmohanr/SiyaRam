//
//  UsersService.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import Firebase

class UsersService {
    
    static func fetchUser(withuID uid: String) async throws -> User {
        let shot = try await Firestore.firestore().collection(DBKeys.users.rawValue).document(uid).getDocument()
        return try shot.data(as: User.self)
    }
    
    @MainActor
   static func loadAllUsers() async throws -> [User] {
        let shot = try await Firestore.firestore().collection(DBKeys.users.rawValue).getDocuments()
       return shot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
