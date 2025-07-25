//
//  MainPageTests.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class MainPageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app:app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
    }
    
    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
    
    @MainActor
    func testMainPageElementsAreDisplayed() throws {
        mainPage
            .checkPageIsOpened()
            .checkEmailFieldIsDisplayed()
            .checkCheckButtonIsDisplayed()
            .checkLoginButtonIsDisplayed()
    }
    
    @MainActor
    func testTypeEmailOnMainScreen() throws {
        mainPage
            .checkPageIsOpened()
            .checkEmailFieldIsDisplayed()
            .typeEmail(email:TestUserConfig.userEmail)
    }
    
    
    @MainActor
    func testCheckUnregisteredEmail() throws {
        mainPage
            .checkPageIsOpened()
            .typeEmail(email:TestUserConfig.unregisteredEmail)
            .tapCheckButton()
            .checkFailureMessageIsDisplayed()
    }
    
    
    @MainActor
    func testNavigateToLoginFromMainScreen() throws {
        mainPage
            .checkPageIsOpened()
            .tapLoginButton()
    }
} 
