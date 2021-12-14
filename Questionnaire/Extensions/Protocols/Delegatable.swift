//
//  Delegatable.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

protocol Delegatable: AnyObject {
    
    var delegate: AnyObject? { get set }
}
