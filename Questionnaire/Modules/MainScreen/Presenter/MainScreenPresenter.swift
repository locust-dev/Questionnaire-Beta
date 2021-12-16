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
    
    
    // MARK: - Private methods
    
    private func createViewControllers() -> [UIViewController] {
        
        let userModule: Module
        
        if interactor?.isAuthorized == true {
            let profileModel = ProfileAssembly.Model(moduleOutput: self , tabBarTitle: "username")
            userModule = ProfileAssembly.assembleModule(with: profileModel)
            
        } else {
            // TODO: - From config
            let authModel = AuthorizationAssembly.Model(tabBarTitle: "Profile", moduleOutput: self)
            userModule = AuthorizationAssembly.assembleModule(with: authModel)
        }
        
        // TODO: - From config
        let testsModel = TestCategoriesAssembly.Model(tabBarTitle: "Tests")
        let testsModule = TestCategoriesAssembly.assembleModule(with: testsModel)
        
        return [testsModule, userModule]
    }

}


// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {
    
    func viewWillAppear() {
        view?.set(viewControllers: createViewControllers())
    }
}


// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {  }


// MARK: - AuthorizationModuleOutput
extension MainScreenPresenter: AuthorizationModuleOutput {
    
    func didSuccessAuthorized() {
        view?.set(viewControllers: createViewControllers())
    }
}


// MARK: - ProfileModuleOutput
extension MainScreenPresenter: ProfileModuleOutput {
    
    func didTapLogOutButton() {
        interactor?.logOut()
        view?.set(viewControllers: createViewControllers())
    }
}


// MARK: - RegistrationModuleOutput
extension MainScreenPresenter: RegistrationModuleOutput {
    
    func didSuccessToSaveNewUser() {
        view?.set(viewControllers: createViewControllers())
    }
}
