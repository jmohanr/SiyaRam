//
//  Comments.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import Foundation

struct Comments: Identifiable,Codable {
    var id: String
    var comment: String
    var ownerId: String
    var isLiked: Bool
}
