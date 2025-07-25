//
//  EditProfilePageTests.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

final class EditProfilePageTests: XCTestCase {
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app:app)
    private lazy var loginPage = LoginPage(app:app)
    private lazy var editProfilePage = EditProfilePage(app:app)
    private lazy var profilePage = ProfilePage(app:app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
        
        // Идем на страницу редактирования профиля до тестов
        TestHelper.loginUser(app: app)
        profilePage
            .checkPageIsOpened()
            .tapEditProfileButton()
        editProfilePage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testEditProfilePageElementsAreDisplayed() throws {
        editProfilePage
            .checkNameFieldIsDisplayed()
            .checkSaveButtonIsDisplayed()
            .checkCancelButtonIsDisplayed()
    }
    
    @MainActor
    func testTypeNameOnEditProfileScreen() throws {
        let newName = TestUserConfig.getNextCat()
        editProfilePage
            .clearNameField()
            .typeName(name:newName)
    }
    
    @MainActor
    func testSaveButtonIsDisabledWhenNameIsEmptyOnEditProfileScreen() throws {
        editProfilePage
            .clearNameField()
            .checkSaveButtonIsDisabled()
    }
    
    @MainActor
    func testSaveButtonIsEnabledWhenNameIsFilledOnEditProfileScreen() throws {
        let newName = TestUserConfig.getNextCat()
        editProfilePage
            .clearNameField()
            .typeName(name:newName)
            .checkSaveButtonIsEnabled()
    }
    
    @MainActor
    func testUpdateNameSuccessfullyOnEditProfileScreen() throws {
        // Читаем текущее имя из поля ввода на странице редактирования
        let currentName = editProfilePage.getNameFieldValue()
        print("Текущее имя: \(currentName)")
        
        // Берем новое имя котика, отличное от текущего
        var newName = TestUserConfig.getNextCat()
        while newName == currentName {
            newName = TestUserConfig.getNextCat()
        }
        print("Новое имя: \(newName)")
        
        editProfilePage
            .clearNameField()
            .typeName(name:newName)
            .tapSaveButton()
        //
        //            .tapCancelButton()
        profilePage
            .checkPageIsOpened()
        let updatedUserName = profilePage.getUserName()
        print("Обновленное имя: \(updatedUserName)")
        
        XCTAssertNotEqual(updatedUserName, currentName)
        XCTAssertEqual(updatedUserName, newName)
    }
    
    @MainActor
    func testCancelButtonReturnsToProfileFromEditProfileScreen() throws {
        editProfilePage
            .tapCancelButton()
        profilePage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testEmptyNameValidationOnEditProfileScreen() throws {
        editProfilePage
            .clearNameField()
            .tapSaveButton()
        
        XCTAssertFalse(app.alerts.firstMatch.exists)
    }
} 
