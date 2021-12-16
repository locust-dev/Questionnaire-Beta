//
//  ErrorModel.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import Foundation

enum ErrorModel: Error {
    
    case somethingWentWrong
    case serverError
    
    // Users
    case userNotAuthorized
    case errorToSaveNewUser
    case errorToLoadUserInfo
    

}
