//
//  CastRepository.swift
//  TMDB
//
//  Created by AVINASH on 30/05/26.
//

import Foundation

protocol CastRepository {
    func getCastDetail(creditId: String) async throws -> Person
}

class CastRepositoryImpl: CastRepository {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getCastDetail(creditId: String) async throws -> Person {
        do {
            let castResponse: CastResponse = try await client.executeRequest(with: CastEndpoint.castDetail(creditId: creditId))
            return castResponse.person
        } catch {
            throw CastError.castNotFound
        }
    }
}
