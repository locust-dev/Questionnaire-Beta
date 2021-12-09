//
//  Configurable.swift
//  Questionnaire
//
//  Created by Ilya Turin on 09.12.2021.
//

protocol Configurable {
    
    associatedtype Model
    
    func configure(with model: Model)
    
}
