//
//  MainPage.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class MainPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["mainTitle"].firstMatch
    }
    
    private var emailField: XCUIElement {
        return app.textFields["emailInput"].firstMatch
    }
    
    private var successEmailField: XCUIElement {
        return app.textFields["successEmailInput"].firstMatch
    }
    
    private var failureEmailField: XCUIElement {
        return app.textFields["failureEmailInput"].firstMatch
    }
    
    private var checkButton: XCUIElement {
        return app.buttons["checkButton"].firstMatch
    }
    
    
    private var loginButton: XCUIElement {
        return app.buttons["navigationButton"].firstMatch
    }
    
    
    private var successText: XCUIElement {
        return app.staticTexts["successText"].firstMatch
    }
    
    private var failureText: XCUIElement {
        return app.staticTexts["failureText"].firstMatch
    }
    
    private var errorMessage: XCUIElement {
        return app.staticTexts["errorMessage"].firstMatch
    }
    
    @discardableResult
    func checkPageIsOpened() -> Self {
        XCTAssert(screenTitle.waitForExistence(timeout: 10))
        return self
    }
    
    @discardableResult
    func checkEmailFieldIsDisplayed() -> Self {
        XCTAssert(emailField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkCheckButtonIsDisplayed() -> Self {
        XCTAssert(checkButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkLoginButtonIsDisplayed() -> Self {
        XCTAssert(loginButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkScreenTitleIsDisplayed() -> Self {
        XCTAssert(screenTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkSuccessMessageIsDisplayed() -> Self {
        XCTAssert(successText.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkSuccessMessageIsNotDisplayed() -> Self {
        XCTAssert(successText.waitForNonExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkFailureMessageIsDisplayed() -> Self {
        XCTAssert(failureText.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkFailureMessageIsNotDisplayed() -> Self {
        XCTAssert(failureText.waitForNonExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkErrorMessageIsDisplayed() -> Self {
        XCTAssert(errorMessage.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func tapCheckButton() -> Self {
        checkButton.tap()
        return self
    }
    
  
    @discardableResult
    func tapLoginButton() -> Self {
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func typeEmail(email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        XCTAssert(emailField.value.debugDescription.contains(email))
        return self
    }
    
    
    @discardableResult
    func checkEmail(email: String) -> Self {
        return typeEmail(email:email)
            .tapCheckButton()
    }
    
}
