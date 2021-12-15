//
//  TestResultPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestResultViewOutput: ViewOutput {
    func didTapFinishButton()
}

protocol TestResultInteractorOutput: AnyObject {
    func didSuccessObtainAnswers(_ answers: [RightAnswersModel])
    func didFailObtainAnswers()
}

final class TestResultPresenter {
    
    // MARK: - Properties
    
    weak var view: TestResultViewInput?
    
    var router: TestResultRouterInput?
    var interactor: TestResultInteractorInput?

    private let dataConverter: TestResultDataConverterInput
    private let userAnswers: [Int: Int]
    private let testId: String
    
    
    // MARK: - Init
    
    init(dataConverter: TestResultDataConverterInput,
         userAnswers: [Int: Int],
         testId: String) {
        
        self.dataConverter = dataConverter
        self.userAnswers = userAnswers
        self.testId = testId
    }
    
}


// MARK: - TestResultViewOutput
extension TestResultPresenter: TestResultViewOutput {
    
    func didTapFinishButton() {
        router?.closeModule()
    }
    
    func viewIsReady() {
        view?.showHUD()
        interactor?.getRightAnswers()
    }
    
}


// MARK: - TestResultInteractorOutput
extension TestResultPresenter: TestResultInteractorOutput {
    
    func didSuccessObtainAnswers(_ answers: [RightAnswersModel]) {
        
        view?.hideHUD()
        
        guard let filteredAnswers = answers.filter({ $0.testId == testId }).first else {
            return
        }
        
        let viewModel = dataConverter.convert(rightAnswers: filteredAnswers, userAnswers: userAnswers)
        view?.update(with: viewModel)
    }
    
    func didFailObtainAnswers() {
        
        // TODO: - ...
    }
}


// MARK: - TestResultTableViewManagerDelegate
extension TestResultPresenter: TestResultTableViewManagerDelegate {  }
