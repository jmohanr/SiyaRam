//
//  SearchView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    ForEach(viewModel.searchdata) { datum in
                        NavigationLink {
                            ProfileView(currentUser: datum)
                        } label: {
                            ExploreView(user:  datum)
                        }
                    }
                }
                Loader(message: "Loading ....", count: $viewModel.itemsCount)

            }.searchable(text: $viewModel.searchText, prompt: "Search Here")
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
