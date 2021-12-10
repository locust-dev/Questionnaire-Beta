//
//  AuthorizationAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

final class AuthorizationAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model else {
            fatalError("Wrong model for AuthorizationModule")
        }
        
        let authService = FirebaseAuthService()
        
        let view = AuthorizationViewController()
        let router = AuthorizationRouter(transition: view)
        let interactor = AuthorizationInteractor(authorizationService: authService)
        let presenter = AuthorizationPresenter(moduleOutput: model.moduleOutput)
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        view.tabBarItem.title = model.tabBarTitle
        view.tabBarItem.image = Images.tabbar_profile()
        
        return view
    }

}


// MARK: - Model
extension AuthorizationAssembly {
    
    struct Model: TransitionModel {
        
        let tabBarTitle: String
        weak var moduleOutput: AuthorizationModuleOutput?
    }
}
