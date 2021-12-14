//
//  TestsPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestsViewOutput: ViewOutput {  }

protocol TestsInteractorOutput: AnyObject {
    func didSuccessObtainTests(_ tests: [TestsModel])
    func didFailObtainTests()
}

final class TestsPresenter {
    
    // MARK: - Properties
    
    weak var view: TestsViewInput?
    
    var router: TestsRouterInput?
    var interactor: TestsInteractorInput?

    private let dataConverter: TestsDataConverterInput
    private let categoryId: String
    
    
    // MARK: - Init
    
    init(dataConverter: TestsDataConverterInput,
         categoryId: String) {
        
        self.dataConverter = dataConverter
        self.categoryId = categoryId
    }
    
}


// MARK: - TestsViewOutput
extension TestsPresenter: TestsViewOutput {
    
    func viewIsReady() {
        view?.showHUD()
        interactor?.getTests()
    }
    
}


// MARK: - TestsInteractorOutput
extension TestsPresenter: TestsInteractorOutput {
    
    func didSuccessObtainTests(_ tests: [TestsModel]) {
        view?.hideHUD()
        
        guard let testsByCurrentCategory = tests.filter { $0.categoryIdentifier == categoryId }.first
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


// MARK: - TestsTableViewManagerDelegate
extension TestsPresenter: TestsTableViewManagerDelegate {  }
