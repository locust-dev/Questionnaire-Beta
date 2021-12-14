//
//  TestsInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import Foundation

protocol TestsInteractorInput: Parser {
    func getTests()
}

final class TestsInteractor {
    
    // MARK: - Properties
    
    weak var presenter: TestsInteractorOutput?

    private let databaseService: FBDatabaseService
    

    // MARK: - Init
    
    init(databaseService: FBDatabaseService) {
        self.databaseService = databaseService
    }
    
}


// MARK: - MainScreenInteractorInput
extension TestsInteractor: TestsInteractorInput {
    
    func getTests() {
        
        databaseService.getData(.tests) { [weak self] result in
            
            switch result {
                
            case .success(let testsData):
                guard let tests = self?.parseArray(rawData: testsData, type: TestsModel.self)
                else {
                    // TODO: - Handle error
                    self?.presenter?.didFailObtainTests()
                    return
                }
                
                self?.presenter?.didSuccessObtainTests(tests)
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.didFailObtainTests()
            }
        }
    }
    
}
