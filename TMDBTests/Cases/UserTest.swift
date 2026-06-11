//
//  UserTest.swift
//  TMDBTests
//
//  Created by AVINASH on 02/06/26.
//


import XCTest
@testable import TMDB

final class UserTests: XCTestCase {

    private var loader: DataLoader!

    override func setUp() {
        super.setUp()
        loader = DataLoader()
    }

    override func tearDown() {
        loader = nil
        super.tearDown()
    }

    private func makeSUT() throws -> User {
        try loader.loadFile(withFileName: "user")
    }
}

// MARK: - Debug

extension UserTests {

    func testDebug_userJSONExists() {

        let bundle = Bundle(for: Self.self)

        print("Bundle Path:")
        print(bundle.bundlePath)

        let url = bundle.url(
            forResource: "user",
            withExtension: "json"
        )

        print("URL:")
        print(url as Any)

        XCTAssertNotNil(url)
    }

    func testDebug_userValues() throws {

        let sut = try makeSUT()

        print("ID:", sut.id)
        print("Name:", sut.name)
        print("Username:", sut.username)
        print("Image:", sut.image)

        print("ImageURL:", sut.imageURL as Any)
    }
}

// MARK: - Decoding

extension UserTests {

    func testUser_decodesId() throws {

        let sut = try makeSUT()

        XCTAssertEqual(
            sut.id,
            123
        )
    }

    func testUser_decodesName() throws {

        let sut = try makeSUT()

        XCTAssertEqual(
            sut.name,
            "Avinash K"
        )
    }

    func testUser_decodesUsername() throws {

        let sut = try makeSUT()

        XCTAssertEqual(
            sut.username,
            "avi651"
        )
    }

    func testUser_decodesImagePath() throws {

        let sut = try makeSUT()

        XCTAssertEqual(
            sut.image,
            "/asdfurl.png"
        )
    }
}

// MARK: - URL

extension UserTests {

    func testImageURL_isNotNil() throws {

        let sut = try makeSUT()

        XCTAssertNotNil(
            sut.imageURL
        )
    }
}
