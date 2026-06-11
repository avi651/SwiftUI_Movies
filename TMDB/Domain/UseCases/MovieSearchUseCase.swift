//
//  MovieSearchUseCase.swift
//  TMDB
//
//  Created by AVINASH on 10/06/26.
//

import Foundation

protocol GetMovieSearchUseCase {
    func execute(query: String) async throws -> [Movie]
}

final class GetMovieSearchUseCaseImpl: GetMovieSearchUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(query: String) async throws -> [Movie] {
        try await repository.searchMovies(query: query)
    }
}

