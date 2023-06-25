//
//  SearchView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var searchData: [User] = []
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(exploreData) { datum in
                    NavigationLink {
                        ProfileView(currentUser: datum)
                    } label: {
                        ExploreView(user:  datum)
                    }

                }
            }.searchable(text: $searchText, prompt: "Search Here")
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
                
        }
    }
    
    var exploreData: [User] {
      
        if(searchText.count > 0) {
            return searchData.filter({$0.userName.contains(searchText)})
        }
        return viewModel.allUsers
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
