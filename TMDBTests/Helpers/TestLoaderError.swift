//
//  TestLoaderError.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import Foundation

enum TestLoaderError: LocalizedError {
    
    case fileNotFound(String)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let fileName):
            return "Unable to locate \(fileName)"
        }
    }
}
