//
//  FBDatabaseRequestKey.swift
//  Questionnaire
//
//  Created by Ilya Turin on 11.12.2021.
//

enum FBDatabasePath {
   
    case categories
    case tests
    case rightAnswers
    case user(token: String)
    
    var stringPath: String {
        
        switch self {
            
        case .categories:
            return "categories"
            
        case .tests:
            return "tests"
            
        case .rightAnswers:
            return "rightAnswers"
              
        case .user(token: let token):
            return "users/\(token)"
        }
    }
}
