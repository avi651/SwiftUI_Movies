//
//  LoginViewUITests.swift
//  TMDBUITests
//
//  Created by AVINASH on 25/05/26.
//

import XCTest

final class LoginViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_loginView_signInButton_shouldDisplayProgressIndicator() {
        let progressIndicator = app.activityIndicators["SubmitProgressIndicator"]
        let loadingText = app.staticTexts["Loading"]
        
        XCTAssertTrue(progressIndicator.exists)
        XCTAssertTrue(loadingText.exists)
    }
}
