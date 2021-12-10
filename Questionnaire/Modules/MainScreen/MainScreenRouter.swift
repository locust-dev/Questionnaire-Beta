//
//  MainScreenRouter.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol MainScreenRouterInput {
    func openAuthorization()
}

final class MainScreenRouter {
    
    // MARK: - Properties
    
    private unowned let transition: ModuleTransitionHandler
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
    
}


// MARK: - MainScreenRouterInput
extension MainScreenRouter: MainScreenRouterInput {
    
    func openAuthorization() {
       // transition.present(animated: true, moduleType: AuthorizationAssembly.self)
    }
}
