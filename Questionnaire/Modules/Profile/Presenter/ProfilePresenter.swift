//
//  ProfilePresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol ProfileViewOutput: ViewOutput {
    func didTapLogOutButton()
}

protocol ProfileModuleOutput: AnyObject {
    func didTapLogOutButton()
}

final class ProfilePresenter {
    
    // MARK: - Properties
    
    weak var view: ProfileViewInput?
    
    var router: ProfileRouterInput?
    
    private let moduleOutput: ProfileModuleOutput?
    
    
    // MARK: - Init
    
    init(moduleOutput: ProfileModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
    
}


// MARK: - ProfileViewOutput
extension ProfilePresenter: ProfileViewOutput {
    
    func viewIsReady() {
//        let viewModel = ProfileViewModel(firstName: , lastName: )
//        view?.update(with: viewModel)
    }
    
    func didTapLogOutButton() {
        moduleOutput?.didTapLogOutButton()
    }
}
