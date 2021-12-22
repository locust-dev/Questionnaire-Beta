//
//  TestQuestionMistakePresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 22.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestQuestionMistakeViewOutput: ViewOutput {  }

final class TestQuestionMistakePresenter {
    
    // MARK: - Properties
    
    weak var view: TestQuestionMistakeViewInput?

    private let dataConverter: TestQuestionMistakeDataConverterInput
    private let questionMistakeModel: QuestionMistakeModel
    
    
    // MARK: - Init
    
    init(dataConverter: TestQuestionMistakeDataConverterInput,
         questionMistakeModel: QuestionMistakeModel) {
        
        self.dataConverter = dataConverter
        self.questionMistakeModel = questionMistakeModel
    }

}


// MARK: - TestQuestionMistakeViewOutput
extension TestQuestionMistakePresenter: TestQuestionMistakeViewOutput {
    
    func viewIsReady() {
        let viewModel = dataConverter.convert(questionMistakeModel: questionMistakeModel)
        view?.update(with: viewModel)
    }
    
}


// MARK: - TestQuestionMistakeTableViewManagerDelegate
extension TestQuestionMistakePresenter: TestQuestionMistakeTableViewManagerDelegate {  }
