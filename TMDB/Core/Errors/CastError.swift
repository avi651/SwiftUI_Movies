//
//  CastError.swift
//  TMDB
//
//  Created by AVINASH on 25/05/26.
//

import Foundation

enum CastError: LocalizedError {
    case castNotFound
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .castNotFound:
            return "Cast not found"
        case .unknown:
            return "Something went wrong"
        }
    }
}
