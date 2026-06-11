//
//  CastDetailUseCase.swift
//  TMDB
//
//  Created by AVINASH on 03/06/26.
//

import Foundation

protocol CastDetailUseCase {
    func execute(creditId: String) async throws -> Person
}

final class CastDetailUseCaseImpl : CastDetailUseCase {
    private let repository: CastRepository
    
    init(repository: CastRepository) {
        self.repository = repository
    }
    
    func execute(creditId: String) async throws -> Person {
        try await repository.getCastDetail(creditId: creditId)
    }
}

