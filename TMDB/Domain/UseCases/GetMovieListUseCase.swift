//
//  GetMovieListUseCase.swift
//  TMDB
//
//  Created by AVINASH on 01/06/26.
//

import Foundation

protocol GetMovieListUseCase {
    func execute(endpoint: MovieEndpoint) async throws -> [Movie]
}

final class GetMovieListUseCaseImpl: GetMovieListUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(endpoint: MovieEndpoint) async throws -> [Movie] {
        try await repository.getMovieList(endpoint: endpoint)
    }
}
