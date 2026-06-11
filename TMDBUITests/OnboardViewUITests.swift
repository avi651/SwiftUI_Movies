//
//  OnboardViewUITests.swift
//  TMDBUITests
//
//  Created by AVINASH on 30/05/26.
//

import XCTest

final class OnboardViewUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
         continueAfterFailure = false
        app.launch()
    }
    
    func test_onboardView_shouldDisplayMessageWithPageIndicator() {
        // Given
        let text = app.staticTexts["WelcomeMessage"]
        
        // Then
        XCTAssertTrue(text.exists)
    }
    
    func test_onboardView_shouldNavigateToLoginView() {
        // Given
        let tabView = app.collectionViews.element
        tabView.swipeLeft()
        tabView.swipeRight()
        
        // When
        let button = app.buttons["ContinueButton"]
        button.tap()
        
        let signInButton = app.buttons["SubmitButton"]
        // Then
        XCTAssertTrue(signInButton.exists)
    }
}
