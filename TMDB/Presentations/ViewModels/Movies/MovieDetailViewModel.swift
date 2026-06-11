//
//  MovieDetailViewModel.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import Foundation
import Combine

@MainActor
final class MovieDetailViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    @Published var movie: Movie?
    
    public var movieError: Error?
    
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    private let moviesDetailsUseCase: MoviesDetailsUseCase
    
    init(moviesDetailsUseCase: MoviesDetailsUseCase) {
        self.moviesDetailsUseCase = moviesDetailsUseCase
    }
    
    func fetchMovieDetails(movieId: Int) async {
        state = .loading
        do {
            let movieDetail = try await moviesDetailsUseCase.execute(movieId: movieId)
            self.movie = movieDetail
            state = .idle
        } catch {
            hasError = true
            movieError = error
            state = .idle
        }
    }
}
