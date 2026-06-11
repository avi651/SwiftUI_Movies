//
//  MovieDetailView.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import SwiftUI
import NukeUI
import FactoryKit

struct MovieDetailView: View {

    @StateObject private var movieDetailViewModel =
        Container.shared.movieDetailViewModel()
    @StateObject private var movieCastViewModel = Container.shared.movieCastViewModel()

    let movieID: Int

    var body: some View {
        ZStack {

            if movieDetailViewModel.isLoading {
                ProgressLoader()
            } else {

                let movie = movieDetailViewModel.movie

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 0) {

                        MovieStickyHeader(
                            imageURL: movie?.backdropURL,
                            height: 280
                        )

                        VStack(alignment: .leading, spacing: 12) {

                            Text(movie?.title ?? "Not Found")
                                .font(.title)
                                .fontWeight(.bold)

                            Text(
                                "\(movie?.releaseDate ?? "Not Found") • \(movie?.durationText ?? "Not Found")"
                            )

                            HStack {
                                RatingView(
                                    rating: 5,
                                    maxRating: 5
                                )

                                if let ratingText = movie?.ratingText {
                                    Text(ratingText)
                                }
                            }

                            VStack(alignment: .leading, spacing: 8) {

                                Text(movie?.genreText ?? "Not Found")
                                    .fontWeight(.medium)

                                Text(movie?.overview ?? "Not Found")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.vertical)

                            MovieCastView(casts: movieCastViewModel.cast)
                        }
                        .padding()
                    }
                }
                .ignoresSafeArea(edges: .top).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {
            await fetchMovieDetail()
            await fetchMovieCasts()
        }
    }

    private func fetchMovieDetail() async {
        await movieDetailViewModel.fetchMovieDetails(
            movieId: movieID
        )
    }
    
    private func fetchMovieCasts() async {
        await movieCastViewModel.fetchMovieCast(movieId: movieID)
    }
}
