//
//  Test.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

struct Test: Decodable {
    
    let id: Int
    let testName: String
    let questions: [Question]
}
