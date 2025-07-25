// Tags.swift
// Список accessibilityIdentifier для UI-элементов всех экранов (Page)

struct Tags {
    struct MainPage {
        static let mainTitle = "mainTitle"
        static let emailInput = "emailInput" 
        static let checkButton = "checkButton" // или recheckButton, failureRecheckButton
        static let navigationButton = "navigationButton" // или successNavigationButton, failureNavigationButton
        static let errorMessage = "errorMessage"
        static let successText = "successText"
        static let failureText = "failureText"
    }
    
    struct LoginPage {
        static let loginTitle = "loginTitle"
        static let emailField = "emailField"
        static let passwordField = "passwordField"
        static let validationError = "validationError"
        static let loginButton = "loginButton"
        static let backButton = "backButton"
        static let registerButton = "registerButton"
    }
    
    struct RegisterPage {
        static let registerTitle = "registerTitle"
        static let emailField = "emailField"
        static let passwordField = "passwordField"
        static let ageField = "ageField"
        static let validationError = "validationError"
        static let registerButton = "registerButton"
        static let backButton = "backButton"
    }
    
    struct ProfilePage {
        static let profileImage = "profileImage"
        static let userName = "userName"
        static let ageLabel = "ageLabel"
        static let postsCount = "postsCount"
        static let followersCount = "followersCount"
        static let likesCount = "likesCount"
        static let logoutButton = "logoutButton"
        static let editProfileButton = "editProfileButton"
        static func photo(_ index: Int) -> String { "photo\(index)" }
    }
    
    struct EditProfilePage {
        static let nameField = "nameField"
        static let saveButton = "saveButton"
        static let cancelButton = "cancelButton"
    }
} 
