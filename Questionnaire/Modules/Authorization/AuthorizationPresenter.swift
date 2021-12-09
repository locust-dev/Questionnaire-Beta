//
//  AuthorizationPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol AuthorizationViewOutput: ViewOutput {  }

final class AuthorizationPresenter {
    
    // MARK: - Properties
    
    weak var view: AuthorizationViewInput?
    
    var router: AuthorizationRouterInput?
    
}


// MARK: - AuthorizationViewOutput
extension AuthorizationPresenter: AuthorizationViewOutput {
    
    func viewIsReady() {
        
        let viewModel = AuthorizationViewModel(mainTitle: "Authorization screen")
        view?.update(with: viewModel)
    }
    
}
