//
//  TestCategoriesInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import Foundation

protocol TestCategoriesInteractorInput: Parser {
    
    var isAuthorized: Bool { get }
    
    func getCategories()
}

final class TestCategoriesInteractor {
    
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
        
        databaseService.getData(FBDatabasePath.categories) { [weak self] result in
            
            switch result {
                
            case .success(let categoriesData):
                guard let categories = self?.parseJson(rawData: categoriesData, type: [TestCategoryModel].self)
                else {
                    // TODO: - Error model
                    self?.presenter?.didFailObtainCategories(error: .nullElements)
                    return
                }

                self?.presenter?.didSuccessObtain(categories: categories)

            case .failure(let error):
                self?.presenter?.didFailObtainCategories(error: error)
            }
        }
    }
    
}
