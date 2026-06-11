//
//  InvalidUserTests.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import XCTest
@testable import TMDB

final class InvalidUserTests: XCTestCase {
    
    func testInvalidUserJSON_throwsDecodingError() {
        
        let loader = DataLoader()
        
        XCTAssertThrowsError(
            try loader.loadFile(
                withFileName: "invalid_user"
            ) as User
        )
    }
}
