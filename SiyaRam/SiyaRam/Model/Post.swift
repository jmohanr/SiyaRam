//
//  Post.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import UIKit
import Firebase

struct Post: Identifiable,Codable {
    var id: String
    var src: String
    var title: String
    var srcType: SrcType
    var isLiked: Bool?
    var likesCount: Int?
    var feedDescription: String?
    var time: Timestamp?
    var ownerId: String?
    var user: User?
    var likes: Likes?
    var comments: Comments?
}


