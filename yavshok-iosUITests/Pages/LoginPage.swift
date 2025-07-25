//
//  LoginPage.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class LoginPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["loginTitle"].firstMatch
    }
    
    private var emailField: XCUIElement {
        return app.textFields["emailField"].firstMatch
    }
    
    private var passwordField: XCUIElement {
        return app.secureTextFields["passwordField"].firstMatch
    }
    
    private var loginButton: XCUIElement {
        return app.buttons["loginButton"].firstMatch
    }
    
    private var backButton: XCUIElement {
        return app.buttons["backButton"].firstMatch
    }
    
    private var registerButton: XCUIElement {
        return app.buttons["registerButton"].firstMatch
    }
    
    private var validationError: XCUIElement {
        return app.staticTexts["validationError"].firstMatch
    }
    
    @discardableResult
    func checkPageIsOpened() -> Self {
        XCTAssert(screenTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkEmailFieldIsDisplayed() -> Self {
        XCTAssert(emailField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPasswordFieldIsDisplayed() -> Self {
        XCTAssert(passwordField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkLoginButtonIsDisplayed() -> Self {
        XCTAssert(loginButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkBackButtonIsDisplayed() -> Self {
        XCTAssert(backButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkRegisterButtonIsDisplayed() -> Self {
        XCTAssert(registerButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func typeEmail(_ email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        XCTAssert(emailField.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func typePassword(_ password: String) -> Self {
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapBackButton() -> Self {
        backButton.tap()
        return self
    }
    
    @discardableResult
    func tapRegisterButton() -> Self {
        registerButton.tap()
        return self
    }
    
    @discardableResult
    func checkValidationErrorIsDisplayed() -> Self {
        XCTAssert(validationError.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func loginUserOnLoginScreen(email: String, password: String) -> Self {
        typeEmail(email)
            .typePassword(password)
            .tapLoginButton()
        return self}
}
