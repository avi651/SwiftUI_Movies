//
//  SearchView.swift
//  TMDB
//
//  Created by AVINASH on 30/05/26.
//

import SwiftUI
import NukeUI
import FactoryKit

struct SearchView: View {
    @StateObject private var searchViewModel = Container.shared.searchViewModel()
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    if searchViewModel.state == .loading {
                        ProgressLoader()
                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    } else if searchViewModel.movies.isEmpty {
                        EmptySearchView(
                            isNotSearched: searchViewModel.movies.isEmpty,
                            searchText: searchViewModel.searchText
                        )
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    } else {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(searchViewModel.movies) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .searchable(text: $searchViewModel.searchText, prompt: Text("Movies and more"))
            }
            .padding(.horizontal)
            .background(Color("Background"))
            .navigationTitle("Search")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movieID: movie.id)
            }
        }
    }
}

#Preview {
    SearchView()
}
