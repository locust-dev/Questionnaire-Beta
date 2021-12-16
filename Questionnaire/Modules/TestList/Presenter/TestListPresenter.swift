//
//  TestListPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestListViewOutput: ViewOutput {  }

protocol TestListInteractorOutput: AnyObject {
    func didSuccessObtainTests(_ tests: [Test], allowedTests: [String])
    func didFailObtainTests(error: ErrorModel)
}

final class TestListPresenter {
    
    // MARK: - Properties
    
    weak var view: TestListViewInput?
    
    var router: TestListRouterInput?
    var interactor: TestListInteractorInput?

    private let dataConverter: TestListDataConverterInput
    private let categoryId: String
    
    
    // MARK: - Init
    
    init(dataConverter: TestListDataConverterInput,
         categoryId: String) {
        
        self.dataConverter = dataConverter
        self.categoryId = categoryId
    }
    
}


// MARK: - TestListViewOutput
extension TestListPresenter: TestListViewOutput {
    
    func viewIsReady() {
        view?.showHUD()
        interactor?.fetchTests(by: categoryId)
    }
    
}


// MARK: - TestListInteractorOutput
extension TestListPresenter: TestListInteractorOutput {
    
    func didSuccessObtainTests(_ tests: [Test], allowedTests: [String]) {
        view?.hideHUD()
        let viewModel = dataConverter.convert(tests: tests, allowedTests: allowedTests)
        view?.update(with: viewModel)
    }
    
    func didFailObtainTests(error: ErrorModel) {
        
        // TODO: - ...
    }
    
}


// MARK: - TestListTableViewManagerDelegate
extension TestListPresenter: TestListTableViewManagerDelegate {
    
    func didTapOnTest(_ test: Test) {
        
        guard let questions = test.questions,
              let testId = test.testId
        else {
            view?.showAlertIfNoQuestionsInTest()
            return
        }
        
        router?.openTest(with: questions, testId: testId)
    }
}
