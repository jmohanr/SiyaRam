//
//  UsersService.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import Firebase

class UsersService {
    
    
    @MainActor
   static func loadAllUsers() async throws -> [User] {
        let shot = try await Firestore.firestore().collection(DBKeys.users.rawValue).getDocuments()
       return shot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
