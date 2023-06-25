//
//  SearchData.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation

struct SearchData: Identifiable {
    var id: String
    var heading: String
    var subHeading: String
    var src: String
    
   static func searchData() -> [SearchData] {
       return [SearchData(id:UUID().uuidString,heading: "Kalki", subHeading: "Born to hunt Kali", src: "kalki"),
               SearchData(id:UUID().uuidString,heading: "Kodanda Rama", subHeading: "Born to break Shiva Dhanush", src: "kodandaRama"),
               SearchData(id:UUID().uuidString,heading: "Rama", subHeading: "Born to kill Ravana", src: "rama")]
    }
}
