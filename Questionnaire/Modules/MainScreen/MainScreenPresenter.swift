//
//  MainScreenPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol MainScreenViewOutput: ViewOutput {  }

protocol MainScreenInteractorOutput: AnyObject {  }

final class MainScreenPresenter {
    
    // MARK: - Properties
    
    weak var view: MainScreenViewInput?
    
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?
    
}


// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {
    
    func viewIsReady() {  }
    
}


// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {  }
