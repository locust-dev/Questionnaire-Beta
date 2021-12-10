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
    
    
    // MARK: - Private methods
    
    private func prepareViewControllers() -> [UIViewController] {
        
        // TODO: - From config
        
        let authModel = AuthorizationAssembly.Model(tabBarTitle: "Profile")
        let authModule = AuthorizationAssembly.assembleModule(with: authModel)
        
        let testsModel = TestsAssembly.Model(tabBarTitle: "Tests")
        let testsModule = TestsAssembly.assembleModule(with: testsModel)
        
        return [testsModule, authModule]
    }
}


// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {
    
    func viewWillAppear() {
        view?.set(viewControllers: prepareViewControllers())
    }
}


// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {  }
