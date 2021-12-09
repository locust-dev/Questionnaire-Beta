//
//  MainScreenInteractor.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol MainScreenInteractorInput {  }

final class MainScreenInteractor {
    
    // MARK: - Properties
    
    weak var presenter: MainScreenInteractorOutput?
    
    private let networkService: MainScreenNetworkServiceInput
    
    
    // MARK: - Init
    
    init(networkService: MainScreenNetworkServiceInput) {
        self.networkService = networkService
    }
    
}


// MARK: - MainScreenInteractorInput
extension MainScreenInteractor: MainScreenInteractorInput {  }
