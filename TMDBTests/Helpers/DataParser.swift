//
//  DataParser.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import Foundation

final class DataParser {
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func parse<T: Decodable>(data: Data) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}
