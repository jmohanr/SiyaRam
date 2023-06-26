//
//  FeedsView.swift
//  SiyaRam
//
//  Created by Kaplan on 23/06/23.
//

import SwiftUI

struct FeedsView: View {
    @StateObject var viewModel = FeedsViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.posts,id: \.id) { item  in
                        FeedHeader(post: item )
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
        FeedsView(viewModel: FeedsViewModel())
    }
}
