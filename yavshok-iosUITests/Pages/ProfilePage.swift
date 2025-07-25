//
//  ProfilePage.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class ProfilePage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    

    
    private var userName: XCUIElement {
        return app.staticTexts["userName"].firstMatch
    }
    
    private var ageLabel: XCUIElement {
        return app.staticTexts["ageLabel"].firstMatch
    }
    
    private var postsCount: XCUIElement {
        return app.staticTexts["postsCount"].firstMatch
    }
    
    private var followersCount: XCUIElement {
        return app.staticTexts["followersCount"].firstMatch
    }
    
    private var likesCount: XCUIElement {
        return app.staticTexts["likesCount"].firstMatch
    }
    
    private var logoutButton: XCUIElement {
        return app.buttons["logoutButton"].firstMatch
    }
    
    private var editProfileButton: XCUIElement {
        return app.buttons["editProfileButton"].firstMatch
    }
    
    @discardableResult
    func checkPageIsOpened() -> Self {
        XCTAssert(userName.waitForExistence(timeout: 5))
        return self
    }
    

    
    @discardableResult
    func checkUserNameIsDisplayed() -> Self {
        XCTAssert(userName.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkAgeLabelIsDisplayed() -> Self {
        XCTAssert(ageLabel.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPostsCountIsDisplayed() -> Self {
        XCTAssert(postsCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkFollowersCountIsDisplayed() -> Self {
        XCTAssert(followersCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkLikesCountIsDisplayed() -> Self {
        XCTAssert(likesCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkLogoutButtonIsDisplayed() -> Self {
        XCTAssert(logoutButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkEditProfileButtonIsDisplayed() -> Self {
        XCTAssert(editProfileButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func tapLogoutButton() -> Self {
        logoutButton.tap()
        return self
    }
    
    @discardableResult
    func tapEditProfileButton() -> Self {
        editProfileButton.tap()
        return self
    }
    
    @discardableResult
    func checkPhotoIsDisplayed(_ index: Int) -> Self {
        let photoElement = app.images["photo\(index)"].firstMatch
        XCTAssert(photoElement.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkAllPhotosAreDisplayed() -> Self {
        for index in 1...4 {
            checkPhotoIsDisplayed(index)
        }
        return self
    }
    
    @discardableResult
    func getUserName() -> String {
        return userName.label
    }
    
    @discardableResult
    func getAgeLabel() -> String {
        return ageLabel.label
    }
} 