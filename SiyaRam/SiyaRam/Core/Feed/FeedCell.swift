//
//  FeedCell.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(FeedData.feedsData()) { item  in
                        FeedHeader(feedHead: FeedHead(src: item.src, name: item.userName))
                        FeedBody(feedData: item)
                        Divider()
                    }
                }.padding(.top,10)
            }.navigationTitle("Feeds")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {} label: {
                            Image(systemName: "paperplane")
                        }
                    }
                }.tint(.black)
        }
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
