//
//  MainScreenPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol MainScreenViewOutput: ViewOutput {  }

protocol MainScreenInteractorOutput: AnyObject {  }

final class MainScreenPresenter {
    
    // MARK: - Properties
    
    weak var view: MainScreenViewInput?
    
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?
    var authorizedUser: AuthorizedUserModel?
    
    
    // MARK: - Private methods
    
    private func setViewControllers() -> [UIViewController] {
        
        let userModule: Module
        
        if let userModel = authorizedUser,
           interactor?.isAuthorized == true {
            let profileModel = ProfileAssembly.Model(tabBarTitle: "Profile", username: userModel.username, userID: userModel.userID)
            userModule = ProfileAssembly.assembleModule(with: profileModel)
            
        } else {
            // TODO: - From config
            let authModel = AuthorizationAssembly.Model(tabBarTitle: "Profile", moduleOutput: self)
            userModule = AuthorizationAssembly.assembleModule(with: authModel)
        }
        
        // TODO: - From config
        let testsModel = TestsAssembly.Model(tabBarTitle: "Tests")
        let testsModule = TestsAssembly.assembleModule(with: testsModel)
        
        return [testsModule, userModule]
    }

}


// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {
    
    func viewWillAppear() {
        view?.set(viewControllers: setViewControllers())
    }
}


// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {  }


// MARK: - AuthorizationModuleOutput
extension MainScreenPresenter: AuthorizationModuleOutput {
    
    func didSuccessAuthorized(userModel: AuthorizedUserModel) {
        authorizedUser = userModel
        view?.set(viewControllers: setViewControllers())
    }
}
