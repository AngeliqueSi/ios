//
//  LoginPageTests.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class LoginPageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app:app)
    private lazy var loginPage = LoginPage(app:app)
    private lazy var registerPage = RegisterPage(app:app)
    
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
    func testLoginPageElementsAreDisplayed() throws {
        mainPage
            .checkPageIsOpened()
            .tapLoginButton()
        loginPage
            .checkPageIsOpened()
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkLoginButtonIsDisplayed()
            .checkRegisterButtonIsDisplayed()
    }
    
    @MainActor
    func testLoginWithRegisteredUser() throws {
        mainPage
              .checkPageIsOpened()
              .tapLoginButton()
        loginPage
            .checkPageIsOpened()
            .loginUserOnLoginScreen(email: TestUserConfig.userEmail, password: TestUserConfig.userPassword)
    }
    
    @MainActor
    func testLoginWithUnregisteredUserOnLoginScreen() throws {
        mainPage
              .checkPageIsOpened()
              .tapLoginButton()
        loginPage
            .checkPageIsOpened()
            .loginUserOnLoginScreen(email: TestUserConfig.unregisteredEmail, password: TestUserConfig.unregisteredPassword)
    }
    
    @MainActor
    func testNavigateToRegisterScreenFromLoginScreen() throws {
        mainPage
              .checkPageIsOpened()
              .tapLoginButton()
        loginPage
            .checkPageIsOpened()
            .tapRegisterButton()
        registerPage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testNavigateFromLoginScreenToMainScreen() throws {
        mainPage
              .checkPageIsOpened()
              .tapLoginButton()
        loginPage
            .checkPageIsOpened()
            .tapBackButton()
        mainPage
            .checkPageIsOpened()
    }
} 
