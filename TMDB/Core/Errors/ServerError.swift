//
//  ServerError.swift
//  TMDB
//
//  Created by AVINASH on 25/05/26.
//

import Foundation

struct ServerError: Codable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool
}
