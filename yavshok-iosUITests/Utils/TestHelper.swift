//
//  TestData.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

// Простые функции для тестов
class TestHelper {
    
    // Функция для логина пользователя
    static func loginUser(app: XCUIApplication) {
        let mainPage = MainPage(app: app)
        let loginPage = LoginPage(app: app)
        // Переходим на главную страницу
        mainPage.checkPageIsOpened()
        mainPage.tapLoginButton()
        
        // Логинимся
        loginPage.checkPageIsOpened()
        loginPage.loginUserOnLoginScreen(email: TestUserConfig.userEmail, password: TestUserConfig.userPassword)
    }
    
    // Функция для регистрации пользователя
    static func registerUser(app: XCUIApplication) {
        let mainPage = MainPage(app: app)
        let loginPage = LoginPage(app: app)
        let registerPage = RegisterPage(app: app);
        // Переходим на главную страницу
        mainPage.checkPageIsOpened()
        mainPage.tapLoginButton()
        
        // Переходим на регистрацию
        loginPage.checkPageIsOpened()
        loginPage.tapRegisterButton()
        
        // Регистрируемся
        registerPage.checkPageIsOpened()
        registerPage.register(
            email: TestUserConfig.userEmail,
            password: TestUserConfig.userPassword,
            age: TestUserConfig.userAge
        )
    }
    
    // Функция для регистрации пользователя с уникальными данными
    static func registerUserWithUniqueData(app: XCUIApplication) {
        let mainPage = MainPage(app: app)
        let loginPage = LoginPage(app: app)
        let registerPage = RegisterPage(app: app)
        // Переходим на главную страницу
        mainPage.checkPageIsOpened()
        mainPage.tapLoginButton()
        
        // Переходим на регистрацию
        loginPage.checkPageIsOpened()
        loginPage.tapRegisterButton()
        
        // Регистрируемся с уникальными данными
        registerPage.checkPageIsOpened()
        
        let uniqueEmail = "user\(Int(Date().timeIntervalSince1970))@example.com"
            
        registerPage.register(
            email: uniqueEmail,
            password: TestUserConfig.userPassword,
            age: TestUserConfig.userAge
        )
    }
    
    // Функция для логаута
    static func logoutUser(app: XCUIApplication) {
        let profilePage = ProfilePage(app: app)
        // Проверяем, залогинен ли пользователь
        if app.staticTexts["userName"].exists {
            profilePage.tapLogoutButton()
        }
    }
    
    // Функция для принудительного логаута (без проверки)
    static func forceLogout(app: XCUIApplication) {
        // Создаем временный ProfilePage для логаута
        let tempProfilePage = ProfilePage(app: app)
        if app.staticTexts["userName"].exists {
            tempProfilePage.tapLogoutButton()
        }
    }
    
    // Функция для проверки, залогинен ли пользователь
    static func isUserLoggedIn(app: XCUIApplication) -> Bool {
        return app.staticTexts["userName"].exists
    }
} 
