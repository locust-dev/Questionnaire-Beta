//
//  TestResultInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import Foundation

protocol TestResultInteractorInput: AnyObject {
    func getRightAnswers(by testId: String)
}

final class TestResultInteractor {
    
    // MARK: - Properties
    
    weak var presenter: TestResultInteractorOutput?
    
    private let databaseService: FBDatabaseServiceProtocol
    
    
    // MARK: - Init
 
    init(databaseService: FBDatabaseServiceProtocol) {
        self.databaseService = databaseService
    }
    
}


// MARK: - TestResultInteractorInput
extension TestResultInteractor: TestResultInteractorInput {
    
    func getRightAnswers(by testId: String) {
        
        databaseService.getData(.rightAnswers(testId: testId)) { [weak self] result in
            
            switch result {
                
            case .success(let answersData):
                guard let answers = answersData as? [Int] else {
                    self?.presenter?.didFailObtainAnswers(error: .notFindAnswers)
                    return
                }
                
                self?.presenter?.didSuccessObtainAnswers(answers)
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.didFailObtainAnswers(error: .notFindAnswers)
            }
        }
    }
}
