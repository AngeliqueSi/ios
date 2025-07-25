//
//  ProfilePageTests.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class ProfilePageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app:app)
    private lazy var loginPage = LoginPage(app:app)
    private lazy var profilePage = ProfilePage(app:app)
    private lazy var editProfilePage = EditProfilePage(app:app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
        TestHelper.loginUser(app: app)
    }
    
    @MainActor
    func testProfilePageElementsAreDisplayed() throws {
        profilePage
            .checkPageIsOpened()
            .checkUserNameIsDisplayed()
            .checkAgeLabelIsDisplayed()
            .checkPostsCountIsDisplayed()
            .checkFollowersCountIsDisplayed()
            .checkLikesCountIsDisplayed()
            .checkLogoutButtonIsDisplayed()
            .checkEditProfileButtonIsDisplayed()
    }
    
    @MainActor
    func testNavigateToEditProfileFromProfileScreen() throws {
        profilePage
            .checkPageIsOpened()
            .tapEditProfileButton()
        editProfilePage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testLogoutFromProfileScreen() throws {
        profilePage
            .checkPageIsOpened()
            .tapLogoutButton()
        mainPage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testProfilePhotosAreDisplayed() throws {
        profilePage
            .checkPageIsOpened()
            .checkAllPhotosAreDisplayed()
    }
} 