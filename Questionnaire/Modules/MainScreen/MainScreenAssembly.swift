//
//  MainScreenAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

final class MainScreenAssembly: Assembly {
    
    static func assembleModule() -> Module {
        
        let authService = FBAuthService()
        let databaseService = FBDatabaseService()
        
        let view = MainScreenViewController()
        let router = MainScreenRouter(transition: view)
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor(databaseService: databaseService, authService: authService)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }

}


// MARK: - Model
extension MainScreenAssembly {
    
    struct Model: TransitionModel {  }
    
}
