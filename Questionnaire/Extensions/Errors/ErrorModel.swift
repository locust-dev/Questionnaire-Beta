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
    case nullElements
  
    // Users
    case userNotFound
    case userNotAuthorized
    case errorToSaveNewUser
    case errorToLoadUserInfo
    
    // Answers
    case notFindAnswers

    var description: String {
        
        switch self {
            
        // TODO: - Localized
        case .nullElements:
            return "Кажется, мы ничего не нашли!"
            
        case .somethingWentWrong:
            return "Что то пошло не так."
            
        case .serverError:
            return "Ошибка сервера. Попробуйте позже."
            
        case .userNotAuthorized:
            return "Не можем авторизовать"
            
        case .errorToSaveNewUser:
            return "К сожалению, мы не смогли вас зарегистрировать, попробуйте позже."
            
        case .errorToLoadUserInfo:
            return "Не можем загрузить информацию о профиле"
            
        case .notFindAnswers:
            return "Хм. Не смогли найти правильные ответы на этот тест!"
            
        case .userNotFound:
            return "Пользователь не найден."
        }
    }
}
