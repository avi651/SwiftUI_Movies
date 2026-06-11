//
//  MovieCard.swift
//  TMDB
//
//  Created by AVINASH on 01/06/26.
//

import SwiftUI
import NukeUI

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        NavigationLink(value: movie) {
            LazyImage(url: movie.posterURL) { state in
                if let image = state.image {
                    image
                        .resizable()
                } else {
                    Color.gray.overlay(alignment: .center) {
                        ProgressView()
                    }
                }
            }
            .frame(width: 110, height: 160)
            .scaledToFill()
            .cornerRadius(6)
            .shadow(radius: 4)
        }
    }
}
