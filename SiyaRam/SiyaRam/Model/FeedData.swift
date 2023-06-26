//
//  FeedData.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import UIKit
import Firebase
struct FeedData: Identifiable,Codable {
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
}

extension FeedData {
    
    static func feedsData() ->  [FeedData] {
        return [FeedData(id:UUID().uuidString,src: "1",title: "Hanuman", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Hanuman World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "2",title: "MahaBhali", srcType: .Image, isLiked: true, likesCount: 30, feedDescription: "Welcom to MahaBhali World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "3",title: "Bhajaran", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Bhajaran World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "4",title: "Anjani Puthara", srcType: .Image, isLiked: true, likesCount: 12, feedDescription: "Welcom to Anjani Puthara World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "5",title: "MahaVeer", srcType: .Image, isLiked: true, likesCount: 45, feedDescription: "Welcom to MahaVeer World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "6",title: "GadhaDari", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to GadhaDari World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "7",title: "PanchaMukhi", srcType: .Image, isLiked: true, likesCount: 123, feedDescription: "Welcom to PanchaMukhi World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "8",title: "SiyaRam", srcType: .Image, isLiked: true, likesCount: 98, feedDescription: "Welcom to SiyaRam World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "9",title: "Raghava", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Raghava World!", time: Timestamp()),
                 FeedData(id:UUID().uuidString,src: "10",title: "Maruthi", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Maruthi World!", time: Timestamp())
                ]
     }
}
