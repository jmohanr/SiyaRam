//
//  Likes.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import Foundation

struct Likes: Identifiable,Codable {
    var id: String
    var postId: String
    var likesCount: Int = 0
    var ownerId: String
    var isLiked: Bool = false
}
