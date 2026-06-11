//
//  LoginUseCase.swift
//  TMDB
//
//  Created by AVINASH on 30/05/26.
//

import Foundation

protocol LoginUseCaseProtocol {
    func execute(
        username: String,
        password: String
    ) async throws -> User
}

final class LoginUseCase: LoginUseCaseProtocol {
    
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    private let validator: LoginValidating
    
    init(authRepository: AuthRepository, accountRepository: AccountRepository, validator: LoginValidating) {
        self.authRepository = authRepository
        self.accountRepository = accountRepository
        self.validator = validator
    }
    
    func execute(username: String, password: String) async throws -> User {
        
        try validator.validate(username: username, password: password)
        
        guard let requestToken = try await authRepository.getRequestToken() else {
            throw NetworkError.serverError
        }
        
        guard let verifiedToken = try await authRepository.verifyRequestToken(requestToken: requestToken, username: username, password: password) else {
            throw NetworkError.serverError
        }
        
        guard let sessionId = try await authRepository.createSession(requestToken: verifiedToken) else {
            throw NetworkError.serverError
        }
        
        UserDefaults.standard.set(
            sessionId,
            forKey: UserDefaultKeys.sessionID
        )
        
        return try await accountRepository.getUserDetail(
            sessionId: sessionId
        )
    }
}
