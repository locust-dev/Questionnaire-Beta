//
//  TestListPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestListViewOutput: ViewOutput {  }

protocol TestListInteractorOutput: AnyObject {
    func didSuccessObtainTests(_ tests: [TestsModel])
    func didFailObtainTests()
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
        interactor?.getTests()
    }
    
}


// MARK: - TestListInteractorOutput
extension TestListPresenter: TestListInteractorOutput {
    
    func didSuccessObtainTests(_ tests: [TestsModel]) {
        view?.hideHUD()
        
        guard let testsByCurrentCategory = tests.filter({ $0.categoryIdentifier == categoryId }).first
        else {
            // TODO: - Handle error
            return
        }
        
        let viewModel = dataConverter.convert(tests: testsByCurrentCategory)
        view?.update(with: viewModel)
    }
    
    func didFailObtainTests() {
        
        // TODO: - ...
    }
    
}


// MARK: - TestListTableViewManagerDelegate
extension TestListPresenter: TestListTableViewManagerDelegate {
    
    func didTapOnTest(_ test: Test) {
        
        guard let questions = test.questions,
              let testId = test.testId
        else {
            view?.showAlertIfNoTests()
            return
        }
        
        router?.openTest(with: questions, testId: testId)
    }
}
