//
//  NetworkError.swift
//  TMDB
//
//  Created by AVINASH on 28/05/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case badRequest
    case decodingError
    case invalidData
    case invalidResponse(serverError: ServerError)
    case serverError
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .badRequest:
            return "Bad Request"
        case .decodingError:
            return "Failed to parse data"
        case .invalidData:
            return "Failed to get data"
        case .invalidResponse(let serverError):
            return "Invalid response from URL: \(String(describing: serverError))"
        case .serverError:
            return "The API is undergoing maintenance. Try again later"
        case .unknown:
            return "Unknown error occured"
        }
    }
}
