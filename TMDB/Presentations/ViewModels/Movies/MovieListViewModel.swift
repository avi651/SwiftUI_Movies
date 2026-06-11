//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by AVINASH on 01/06/26.
//

import Foundation
import Combine

@MainActor
final class MovieListViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case loaded
        case error(String)
    }
    
    @Published private(set) var state: State = .idle
    @Published private(set) var movies: [Movie] = []
    
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    
    private let getMovieListUseCase: GetMovieListUseCase
    
    init(getMovieListUseCase: GetMovieListUseCase) {
        self.getMovieListUseCase = getMovieListUseCase
    }
    
    func fetchMovies(with endpoint: MovieEndpoint) async {
        state = .loading
        
        do {
            movies = try await getMovieListUseCase.execute(
                endpoint: endpoint
            )
            state = .loaded
        } catch {
            movies = []
            state = .error(error.localizedDescription)
        }
    }
}
