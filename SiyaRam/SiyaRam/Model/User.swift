//
//  User.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import SwiftUI
import Firebase

struct User: Identifiable,Codable {
    var id: String
    var emailId: String
    var userName: String
    var src: String?
    var bioData: String?
    
    var isCurrentUser: Bool {
        guard let uId = Auth.auth().currentUser?.uid else {return false}
        return id == uId
    }
}
