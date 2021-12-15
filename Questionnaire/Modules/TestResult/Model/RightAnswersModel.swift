//
//  RightAnswersModel.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

struct RightAnswersModel: Decodable {
    
    let testId: String
    let each: [Int]
}
