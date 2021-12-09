//
//  Assembly.swift
//  Questionnaire
//
//  Created by Ilya Turin on 08.12.2021.
//

import UIKit

typealias Module = UIViewController

protocol Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module
    static func assembleModule() -> Module
}


// MARK: - Default implementation
extension Assembly {
    
    static func assembleModule() -> Module {
        fatalError("Implement assembleModule() in ModuleAssembly")
    }
    
    static func assembleModule(with model: TransitionModel) -> Module {
        fatalError("Implement assembleModule(with model: TransitionModel) in ModuleAssembly")
    }
}
