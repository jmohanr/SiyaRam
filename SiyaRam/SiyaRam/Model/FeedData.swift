//
//  FeedData.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import Foundation

struct FeedData:Identifiable {
    var id: String = UUID().uuidString
    var src: String
    var userName: String
    var srcType: SrcType
    var isLiked: Bool
    var likesCount: Int
    var feedDescription: String
    var time: String
    
   static func feedsData() ->  [FeedData] {
        return [FeedData(src: "1",userName: "Hanuman", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Hanuman World!", time: "3h ago"),
                FeedData(src: "2",userName: "MahaBhali", srcType: .Image, isLiked: true, likesCount: 30, feedDescription: "Welcom to MahaBhali World!", time: "3h ago"),
                FeedData(src: "3",userName: "Bhajaran", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Bhajaran World!", time: "3h ago"),
                FeedData(src: "4",userName: "Anjani Puthara", srcType: .Image, isLiked: true, likesCount: 12, feedDescription: "Welcom to Anjani Puthara World!", time: "3h ago"),
                FeedData(src: "5",userName: "MahaVeer", srcType: .Image, isLiked: true, likesCount: 45, feedDescription: "Welcom to MahaVeer World!", time: "3h ago"),
                FeedData(src: "6",userName: "GadhaDari", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to GadhaDari World!", time: "3h ago"),
                FeedData(src: "7",userName: "PanchaMukhi", srcType: .Image, isLiked: true, likesCount: 123, feedDescription: "Welcom to PanchaMukhi World!", time: "3h ago"),
                FeedData(src: "8",userName: "SiyaRam", srcType: .Image, isLiked: true, likesCount: 98, feedDescription: "Welcom to SiyaRam World!", time: "3h ago"),
                FeedData(src: "9",userName: "Raghava", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Raghava World!", time: "3h ago"),
                FeedData(src: "10",userName: "Maruthi", srcType: .Image, isLiked: false, likesCount: 0, feedDescription: "Welcom to Maruthi World!", time: "3h ago")
               ]
    }
}
