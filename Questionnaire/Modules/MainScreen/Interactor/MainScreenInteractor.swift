//
//  MainScreenInteractor.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import Foundation

protocol MainScreenInteractorInput: Parser {
    
    var isAuthorized: Bool { get }
    
    func logOut()
    func getUserFullname()
}

final class MainScreenInteractor {
    
    // MARK: - Properties
    
    weak var presenter: MainScreenInteractorOutput?

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
extension MainScreenInteractor: MainScreenInteractorInput {
    
    var isAuthorized: Bool {
        authService.isAuthorized
    }
    
    func logOut() {
        authService.logOut()
    }
    
    func getUserFullname() {
        
        guard let userToken = authService.currentUserToken else {
            return
        }
        
        databaseService.getData(.user(token: userToken)) { [weak self] result in
            
            switch result {
                
            case .success(let userData):
                let fullname = self?.parseJson(rawData: userData, type: ProfileModel.self)?.fullName
                self?.presenter?.didObtainFullname(fullname)
                
            case .failure(_):
                break
            }
        }
    }
}
