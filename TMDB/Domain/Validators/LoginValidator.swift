//
//  LoginValidator.swift
//  TMDB
//
//  Created by AVINASH on 30/05/26.
//

import Foundation

protocol LoginValidating {
    func validate(username: String, password: String) throws
}

enum LoginValidationError: LocalizedError {
    case emptyUsername
    case emptyPassword
    
    var errorDescription: String? {
        switch self {
        case .emptyUsername:
            return "Username is required."
        case .emptyPassword:
            return "Password is required."
        }
    }
}

final class LoginValidator: LoginValidating {
    func validate(username: String, password: String) throws {
        guard !username.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty else {
            throw LoginValidationError.emptyUsername
        }
        guard !password.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty else {
            throw LoginValidationError.emptyPassword
        }
    }
}
