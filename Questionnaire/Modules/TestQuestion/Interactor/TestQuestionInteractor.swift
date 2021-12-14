//
//  TestQuestionInteractor.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestQuestionInteractorInput {  }

final class TestQuestionInteractor {
    
    // MARK: - Properties
    
    weak var presenter: TestQuestionInteractorOutput?
    
    
    // MARK: - Init
 
}


// MARK: - TestQuestionInteractorInput
extension TestQuestionInteractor: TestQuestionInteractorInput {  }
