//
//  TestUserConfig.swift
//  yavshok-ios
//
//  Created by Anzhelika Simon on 23.07.2025.
//
import XCTest

// Это примеры значений. Замените перед запуском тестов:

struct TestUserConfig {
    
    // Данные для регистрации пользователя:
    static let userEmail = "cat1@ya.ru"
    static let userPassword = "123456"
    static let userAge = "25"
    static let userName = "Новый котик"
    
    //Незарегистрированный email
    static let unregisteredEmail = "unregisteredemail99@test.com"
    static let unregisteredPassword = "unreg12345"
    
    // Данные для негативных тестов
    static let invalidEmail = "invalid-email"
    static let shortPassword = "123"
    static let invalidAge = "150"
    static let emptyName = ""
    
    // Ротация котиков
    private static var catIndex = 0
    private static let cats = [
        "Новый котик",      // Русский
        "New Cat",          // Английский
        "Nuevo Gato",       // Испанский
        "Neue Katze",       // Немецкий
        "Nouveau Chat"      // Французский
    ]
    
    // Получить следующего котика
    static func getNextCat() -> String {
        let cat = cats[catIndex]
        catIndex = (catIndex + 1) % cats.count
        return cat
    }
} 
