//
//  MovieCastViewModel.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import Foundation
import Combine

@MainActor
final class MovieCastViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case loaded
        case error(String)
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    @Published private(set) var cast: [Cast] = []
    
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    
    private let getMovieCastUseCase: MovieCastUseCase
    
    init(getMovieCastUseCase: MovieCastUseCase) {
        self.getMovieCastUseCase = getMovieCastUseCase
    }
    
    func fetchMovieCast(movieId: Int) async {
        state = .loading
        
        do {
            cast = try await getMovieCastUseCase.execute(movieId: movieId)
            state = .loaded
        } catch {
            cast = []
            state = .error(error.localizedDescription)
        }
    }
}
