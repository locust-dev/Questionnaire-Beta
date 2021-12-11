//
//  MainScreenInteractor.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import Foundation

protocol MainScreenInteractorInput {
    
    var isAuthorized: Bool { get }
    
    func getData(_ key: FBDatabaseRequestKey)
}

final class MainScreenInteractor {
    
    // MARK: - Properties
    
    weak var presenter: MainScreenInteractorOutput?

    private let databaseService: FBDatabaseService
    private let authService: FirebaseAuthService
    

    // MARK: - Init
    
    init(databaseService: FBDatabaseService,
         authService: FirebaseAuthService) {
        
        self.databaseService = databaseService
        self.authService = authService
    }
    
}


// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    
    var isAuthorized: Bool {
        authService.isAuthorized
    }
    
    func getData(_ key: FBDatabaseRequestKey) {
        
        databaseService.getData(key) { result in
            
            switch result {
                
            case .success(let rawData):
                
                print(rawData)
                break
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
