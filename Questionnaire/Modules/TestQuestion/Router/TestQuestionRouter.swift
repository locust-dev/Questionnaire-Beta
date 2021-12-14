//
//  TestQuestionRouter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestQuestionRouterInput {
    func openResults(userAnswers: [Int: Int])
}

final class TestQuestionRouter {
    
    // MARK: - Properties
    
    private unowned let transition: ModuleTransitionHandler
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
    
}


// MARK: - TestQuestionRouterInput
extension TestQuestionRouter: TestQuestionRouterInput {
    
    func openResults(userAnswers: [Int: Int]) {
        let model = TestResultAssembly.Model(userAnswers: userAnswers)
        transition.push(with: model, openModuleType: TestResultAssembly.self)
    }
}
