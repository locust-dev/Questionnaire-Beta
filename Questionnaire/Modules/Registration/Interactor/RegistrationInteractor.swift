//
//  RegistrationInteractor.swift
//  Questionnaire
//
//  Created Ilya Turin on 15.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol RegistrationInteractorInput {
    func writeNewUserInDatabase(_ newUser: NewUserModel)
}

final class RegistrationInteractor {
    
    // MARK: - Properties
    
    weak var presenter: RegistrationInteractorOutput?
    
    private let authService: FBAuthServiceProtocol
    private let databaseService: FBDatabaseServiceProtocol
    
    
    // MARK: - Init
    
    init(authService: FBAuthServiceProtocol,
         databaseService: FBDatabaseServiceProtocol) {
        
        self.authService = authService
        self.databaseService = databaseService
    }
    
}


// MARK: - RegistrationInteractorInput
extension RegistrationInteractor: RegistrationInteractorInput {
    
    func writeNewUserInDatabase(_ newUser: NewUserModel) {
        
        databaseService.saveNewUser(newUser) { [weak self] result in
            
            switch result {
                
            case .success(let token):
                self?.authService.setCurrentUserToken(token)
                self?.presenter?.didSuccessToSaveNewUser()
                
            case .failure(let error):
                self?.presenter?.didFailToSaveNewUser(error: error)
            }
        }
    }
    
}
