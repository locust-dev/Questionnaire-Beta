//
//  AuthorizationAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

final class AuthorizationAssembly: Assembly {
    
    static func assembleModule() -> Module {
        
        let view = AuthorizationViewController()
        let router = AuthorizationRouter(transition: view)
        let presenter = AuthorizationPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        return view
    }

}


// MARK: - Model
extension AuthorizationAssembly {
    
    struct Model: TransitionModel {  }
    
}
