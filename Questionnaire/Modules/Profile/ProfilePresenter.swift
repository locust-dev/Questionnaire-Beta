//
//  ProfilePresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol ProfileViewOutput: ViewOutput {  }

final class ProfilePresenter {
    
    // MARK: - Properties
    
    weak var view: ProfileViewInput?
    
    var router: ProfileRouterInput?
    
    private let username: String
    private let userID: String
    
    
    // MARK: - Init
    
    init(username: String, userID: String) {
        self.username = username
        self.userID = userID
    }
    
}


// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    
    func viewIsReady() {
        
        let viewModel = ProfileViewModel(username: username, userID: userID)
        view?.update(with: viewModel)
    }
}
