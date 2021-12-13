//
//  TestCategoriesInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import Foundation

protocol TestCategoriesInteractorInput {
    
    var isAuthorized: Bool { get }
    
    func getCategories()
}

final class TestCategoriesInteractor: Parser {
    
    // MARK: - Properties
    
    weak var presenter: TestCategoriesInteractorOutput?

    private let databaseService: FBDatabaseService
    private let authService: FBAuthService
    

    // MARK: - Init
    
    init(databaseService: FBDatabaseService,
         authService: FBAuthService) {
        
        self.databaseService = databaseService
        self.authService = authService
    }
    
}


// MARK: - MainScreenInteractorInput
extension TestCategoriesInteractor: TestCategoriesInteractorInput {
    
    var isAuthorized: Bool {
        authService.isAuthorized
    }
    
    func getCategories() {
        
        databaseService.getData(FBDatabaseRequestKey.categories) { [weak self] result in
            
            switch result {
                
            case .success(let categoriesData):
                guard let categories = self?.parseArray(rawData: categoriesData, type: TestCategoryModel.self)
                else {
                    // TODO: - Error model
                    self?.presenter?.didFailObtainCategories(error: nil)
                    return
                }

                self?.presenter?.didSuccessObtain(categories: categories)

            case .failure(let error):
                self?.presenter?.didFailObtainCategories(error: error)
            }
        }
    }
    
}
