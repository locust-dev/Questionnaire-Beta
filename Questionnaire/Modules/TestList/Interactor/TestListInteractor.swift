//
//  TestListInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import Foundation

protocol TestListInteractorInput: Parser {
    func fetchTests(by categoryId: String)
}

final class TestListInteractor {
    
    // MARK: - Properties
    
    weak var presenter: TestListInteractorOutput?

    private var error: ErrorModel?
    private var allowedTests: [String]?
    private var tests: [Test]?
    
    private let databaseService: FBDatabaseServiceInput
    private let authService: FBAuthServiceInput
    private let dispatchGroup = DispatchGroup()
    

    // MARK: - Init
    
    init(databaseService: FBDatabaseServiceInput,
         authService: FBAuthServiceInput) {
        
        self.databaseService = databaseService
        self.authService = authService
    }
    
    
    // MARK: - Private methods
    
    private func getAllowedTests() {

        let userToken = authService.currentUserToken ?? ""
    
        databaseService.getData(FBDatabasePath.allowedTests(token: userToken)) { [weak self] result in
            
            switch result {
                
            case .success(let allowedTestsData):
                guard let allowedTests = allowedTestsData as? [String] else {
                    self?.error = .nonShowingError
                    break
                }
                
                self?.allowedTests = allowedTests
                
            case .failure(let error):
                self?.error = error
            }
    
            self?.dispatchGroup.leave()
        }
    }

    private func getTests(by categoryId: String) {
        
        databaseService.getData(.test(categoryId: categoryId)) { [weak self] result in

            switch result {

            case .success(let testsData):
                guard let testsModel = self?.parseJson(rawData: testsData, type: TestsModel.self)
                else {
                    self?.error = .somethingWentWrong
                    break
                }
                
                self?.tests = testsModel.each

            case .failure(let error):
                self?.presenter?.didFailObtainTests(error: error)
            }
           
            self?.dispatchGroup.leave()
        }
    }

}


// MARK: - MainScreenInteractorInput
extension TestListInteractor: TestListInteractorInput {
    
    func fetchTests(by categoryId: String) {
        
        dispatchGroup.enter()
        getTests(by: categoryId)
        dispatchGroup.enter()
        getAllowedTests()
       
        dispatchGroup.notify(queue: .main) {
            
            if let error = self.error {
                self.presenter?.didFailObtainTests(error: error)
                return
            }
            
            guard let allowedTests = self.allowedTests,
                  let tests = self.tests
            else {
                self.presenter?.didFailObtainTests(error: .somethingWentWrong)
                return
            }
            
            self.presenter?.didSuccessObtainTests(tests, allowedTests: allowedTests)
        }
    }
    
}
