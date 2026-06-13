//
//  UserTests.swift
//  TMDBTests
//
//  Created by AVINASH on 09/06/26.
//

import XCTest
@testable import TMDB

final class UserTests: XCTestCase {
    var user: User!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        user = try DataLoader().loadFile(withFileName: "user")
    }
    
    func testModel_createsUser() {
        XCTAssertNotNil(user, "The user should not be nil")
        
        XCTAssertEqual(user.id, 123)
        XCTAssertEqual(user.name, "Avinash")
        XCTAssertEqual(user.username, "kumaravi651")
        XCTAssertEqual(user.image, "/asdfurl.png")
    }
    
    func testURL_imageURL() {
        XCTAssertNotNil(user.imageURL)
    }
    
    override func tearDownWithError() throws {
        user = nil
        try super.tearDownWithError()
    }
}
