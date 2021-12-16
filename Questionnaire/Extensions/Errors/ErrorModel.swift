//
//  ErrorModel.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import Foundation

enum ErrorModel: Error {
    
    // Entire
    case somethingWentWrong
    case serverError
    
    // Users
    case userNotAuthorized
    case errorToSaveNewUser
    case errorToLoadUserInfo
    
    // Answers
    case notFindAnswers

    var description: String {
        
        switch self {
            
        // TODO: - Localized
        case .somethingWentWrong:
            return "Что то пошло не так."
            
        case .serverError:
            return "Ошибка сервера"
            
        case .userNotAuthorized:
            return "Не можем авторизовать"
            
        case .errorToSaveNewUser:
            return "Не можем сохранить вас в базе"
            
        case .errorToLoadUserInfo:
            return "Не можем загрузить информацию о профиле"
            
        case .notFindAnswers:
            return "Хм. Не смогли найти правильные ответы на этот тест!"
        }
    }
}
