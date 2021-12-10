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
}

final class MainScreenInteractor {
    
    // MARK: - Properties
    
    weak var presenter: MainScreenInteractorOutput?
    
//    // MARK: - Init
//
//    init(networkService: MainScreenNetworkServiceInput) {
//        self.networkService = networkService
//    }
    
}


// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {
    
    var isAuthorized: Bool {
        
        guard let authorizedUserId = UserDefaults.standard.string(forKey: FirebaseUDKeys.userId.rawValue) else {
            return false
        }
        
        return true
    }
}
