//
//  TestCategoriesPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestCategoriesViewOutput: ViewOutput {  }

protocol TestCategoriesInteractorOutput: AnyObject {
    func didSuccessObtain(categories: [String])
    func didFailObtainCategories(error: Error?)
}

final class TestCategoriesPresenter {
    
    // MARK: - Properties
    
    weak var view: TestCategoriesViewInput?
    
    var router: TestCategoriesRouterInput?
    var interactor: TestCategoriesInteractorInput?
    
    private let dataConverter: TestCategoriesDataConverterInput
    
    
    // MARK: - Init
    
    init(dataConverter: TestCategoriesDataConverterInput) {
        self.dataConverter = dataConverter
    }
    
}


// MARK: - TestsViewOutput
extension TestCategoriesPresenter: TestCategoriesViewOutput {
    
    func viewIsReady() {
        view?.showHUD()
        interactor?.getCategories()
    }
    
}


// MARK: - TestCategoriesInteractorOutput
extension TestCategoriesPresenter: TestCategoriesInteractorOutput {
    
    func didSuccessObtain(categories: [String]) {
        
        view?.hideHUD()
        
        let viewModel = dataConverter.convert(categories: categories)
        view?.update(with: viewModel)
    }
    
    func didFailObtainCategories(error: Error?) {
        
        // TODO: - ...
    }
    
}


// MARK: - TestCategoriesTableViewManagerDelegate
extension TestCategoriesPresenter: TestCategoriesTableViewManagerDelegate {
    
    func didSelectItem(at index: Int) {
        
        guard interactor?.isAuthorized == true else {
            view?.showNonAuthorizedAlert()
            return
        }
        
    }
    
}
