//
//  DataLoader.swift
//  TMDBTests
//
//  Created by AVINASH on 02/06/26.
//

import Foundation
@testable import TMDB

final class DataLoader {

    private let decoder: JSONDecoder

    init(
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.decoder = decoder
    }

    func loadFile<T: Decodable>(
        withFileName fileName: String,
        fileExtension: String = "json"
    ) throws -> T {

        let bundle = Bundle(for: Self.self)

        guard let url = bundle.url(
            forResource: fileName,
            withExtension: fileExtension
        ) else {

            throw NSError(
                domain: "TMDBTests",
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey:
                    "\(fileName).\(fileExtension) not found"
                ]
            )
        }

        let data = try Data(contentsOf: url)

        return try decoder.decode(
            T.self,
            from: data
        )
    }
}
