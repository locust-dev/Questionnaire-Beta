//
//  TestQuestionPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestQuestionViewOutput: ViewOutput {  }

final class TestQuestionPresenter {
    
    // MARK: - Properties
    
    weak var view: TestQuestionViewInput?
    
    var router: TestQuestionRouterInput?

    private var userAnswers: [Int: Int] = [:]
    private var currentQuestionNumber = 1
    
    private let dataConverter: TestQuestionDataConverterInput
    private let questions: [Question]
    private let testId: String
    
    
    // MARK: - Init
    
    init(dataConverter: TestQuestionDataConverterInput,
         questions: [Question],
         testId: String) {
        
        self.dataConverter = dataConverter
        self.questions = questions
        self.testId = testId
    }
    
    
    // MARK: - Private methods
    
    private func setQuestion() {
        
        guard let question = questions[safe: currentQuestionNumber - 1],
              currentQuestionNumber <= questions.count
        else {
            router?.openResults(userAnswers: userAnswers, testId: testId)
            return
        }
        
        let model = dataConverter.convertQuestion(question)
        view?.update(with: model)
    }
    
}


// MARK: - TestQuestionViewOutput
extension TestQuestionPresenter: TestQuestionViewOutput {
    
    func viewIsReady() {
        setQuestion()
    }
}

// MARK: - TestQuestionTableViewManagerDelegate
extension TestQuestionPresenter: TestQuestionTableViewManagerDelegate {
    
    func didSelectAnswer(by number: Int) {
        userAnswers[currentQuestionNumber] = number
    }
    
    func didTapConfirmButton() {
        
        guard userAnswers[currentQuestionNumber] != nil else {
            view?.showNotConfirmAlert()
            return
        }
        
        currentQuestionNumber += 1
        setQuestion()
    }
}
