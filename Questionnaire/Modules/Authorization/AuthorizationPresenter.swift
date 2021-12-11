//
//  AuthorizationPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol AuthorizationViewOutput: ViewOutput {
    func didTapConfirmButton(email: String?, password: String?)
    func didTapForgotPasswordButton()
}

protocol AuthorizationInteractorOutput: AnyObject {
    func didSuccessAuthorize(userModel: AuthorizedUserModel)
    func didFailAuthorize()
}

protocol AuthorizationModuleOutput: AnyObject {
    func didSuccessAuthorized(userModel: AuthorizedUserModel)
}

final class AuthorizationPresenter {
    
    // MARK: - Properties
    
    weak var view: AuthorizationViewInput?
    
    var router: AuthorizationRouterInput?
    var interactor: AuthorizationInteractorInput?
    
    private let moduleOutput: AuthorizationModuleOutput?
    
    
    // MARK: - Init
    
    init(moduleOutput: AuthorizationModuleOutput?) {
        self.moduleOutput = moduleOutput
    }
}


// MARK: - AuthorizationViewOutput
extension AuthorizationPresenter: AuthorizationViewOutput {
    
    func viewIsReady() {
        
        // TODO: - From config
        let viewModel = AuthorizationViewModel(mainTitle: "Authorization screen", confirmButtonTitle: "Login", forgotPassButtonTitle: "Forgot password?")
        view?.update(with: viewModel)
    }
    
    func didTapConfirmButton(email: String?, password: String?) {
        view?.showHUD()
        interactor?.tryToSignIn(email: email ?? "", password: password ?? "")
    }
    
    func didTapForgotPasswordButton() {
        
        // TODO: - Handle errors
    }
    
}


// MARK: AuthorizationInteractorOutput
extension AuthorizationPresenter: AuthorizationInteractorOutput {
    
    func didSuccessAuthorize(userModel: AuthorizedUserModel) {
        view?.hideHUD()
        moduleOutput?.didSuccessAuthorized(userModel: userModel)
    }
    
    func didFailAuthorize() {
        view?.hideHUD()
        view?.showErrorAlert()
    }
    
}
