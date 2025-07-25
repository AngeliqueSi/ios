//
//  EditProfilePage.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class EditProfilePage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var nameField: XCUIElement {
        return app.textFields["nameField"].firstMatch
    }
    
    private var saveButton: XCUIElement {
        return app.buttons["saveButton"].firstMatch
    }
    
    private var cancelButton: XCUIElement {
        return app.buttons["cancelButton"].firstMatch
    }
    
    @discardableResult
    func checkPageIsOpened() -> Self {
        XCTAssert(nameField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkNameFieldIsDisplayed() -> Self {
        XCTAssert(nameField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkSaveButtonIsDisplayed() -> Self {
        XCTAssert(saveButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkCancelButtonIsDisplayed() -> Self {
        XCTAssert(cancelButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func typeName(name: String) -> Self {
        nameField.tap()
        nameField.typeText(name)
        XCTAssert(nameField.value.debugDescription.contains(name))
        return self
    }
    
    @discardableResult
    func clearNameField() -> Self {
        nameField.tap()
        nameField.press(forDuration: 1)
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
        return self
    }
    
    @discardableResult
    func tapSaveButton() -> Self {
        saveButton.tap()
        return self
    }
    
    @discardableResult
    func tapCancelButton() -> Self {
        cancelButton.tap()
        return self
    }
    
    @discardableResult
    func checkSaveButtonIsEnabled() -> Self {
        XCTAssert(saveButton.isEnabled)
        return self
    }
    
    @discardableResult
    func checkSaveButtonIsDisabled() -> Self {
        XCTAssertFalse(saveButton.isEnabled)
        return self
    }
    
    
    @discardableResult
    func getNameFieldValue() -> String {
        return nameField.value as? String ?? ""
    }
} 
