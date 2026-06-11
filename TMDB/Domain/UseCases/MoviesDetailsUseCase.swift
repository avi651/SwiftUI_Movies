//
//  MoviesDetailsUseCase.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import Foundation

protocol MoviesDetailsUseCase {
    func execute(movieId: Int) async throws -> Movie
}

final class MoviesDetailsUseCaseImpl: MoviesDetailsUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(movieId: Int) async throws -> Movie {
        try await repository.getMovieDetail(movieId: movieId)
    }
}

