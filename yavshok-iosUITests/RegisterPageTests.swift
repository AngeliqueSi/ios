//
//  RegisterPageTests.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class RegisterPageTests: XCTestCase {
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
        mainPage.checkPageIsOpened()
        mainPage.tapLoginButton()
        loginPage.checkPageIsOpened()
        loginPage.tapRegisterButton()
    }
    
    @MainActor
    func testRegisterPageElementsAreDisplayed() throws {
        registerPage
            .checkPageIsOpened()
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkAgeFieldIsDisplayed()
            .checkRegisterButtonIsDisplayed()
    }
    
    @MainActor
    func testTypeEmailOnRegisterScreen() throws {
        registerPage.checkPageIsOpened()
            .typeEmail(TestUserConfig.userEmail)
    }
    
    @MainActor
    func testTypePasswordOnRegisterScreen() throws {
        registerPage.checkPageIsOpened()
            .typePassword(TestUserConfig.userPassword)
    }
    
    @MainActor
    func testTypeAgeOnRegisterScreen() throws {
        registerPage.checkPageIsOpened()
            .typeAge(TestUserConfig.userAge)
    }
    
    @MainActor
    func testRegisterWithValidDataOnRegisterScreen() throws {
        registerPage.checkPageIsOpened()
            .register(email: TestUserConfig.userEmail, password: TestUserConfig.userPassword, age: TestUserConfig.userAge)
        
        let profilePage = ProfilePage(app: app)
        profilePage.checkPageIsOpened()
    }
    
    @MainActor
    func testRegisterWithInvalidEmailOnRegisterScreen() throws {
        registerPage
            .checkPageIsOpened()
            .register(
                email: TestUserConfig.invalidEmail,
                password: TestUserConfig.userPassword,
                age: TestUserConfig.userAge
            )
    }
    
    @MainActor
    func testRegisterWithShortPasswordOnRegisterScreen() throws {
        registerPage
            .checkPageIsOpened()
            .register(
                email: TestUserConfig.userEmail,
                password: TestUserConfig.shortPassword,
                age: TestUserConfig.userAge
            )
    }
    
    @MainActor
    func testRegisterWithInvalidAgeOnRegisterScreen() throws {
        registerPage
            .checkPageIsOpened()
            .register(
                email: TestUserConfig.userEmail,
                password: TestUserConfig.userPassword,
                age: TestUserConfig.invalidAge
            )
    }
    
    @MainActor
    func testNavigateBackToLoginFromRegisterScreen() throws {
        registerPage
            .checkPageIsOpened()
            .tapBackButton()
        loginPage
            .checkPageIsOpened()
    }
} 