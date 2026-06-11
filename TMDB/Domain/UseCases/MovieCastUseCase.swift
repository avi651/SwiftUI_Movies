//
//  MovieCastUseCase.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import Foundation


protocol MovieCastUseCase {
    func execute(movieId: Int) async throws -> [Cast]
}

final class MovieCastUseCaseImpl: MovieCastUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(movieId: Int) async throws -> [Cast] {
        try await repository.getMovieCast(movieId: movieId)
    }
}
