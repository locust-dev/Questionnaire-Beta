//
//  TestResultInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

protocol TestResultInteractorInput: Parser {
    func getRightAnswers()
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
    
    func getRightAnswers() {
        
        // TODO: - think about request only test id answers!
        databaseService.getData(.rightAnswers) { [weak self] result in
            
            switch result {
                
            case .success(let answersData):
                guard let answers = self?.parseArray(rawData: answersData, type: RightAnswersModel.self) else {
                    self?.presenter?.didFailObtainAnswers()
                    return
                }
                
                self?.presenter?.didSuccessObtainAnswers(answers)
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.didFailObtainAnswers()
            }
        }
    }
}
