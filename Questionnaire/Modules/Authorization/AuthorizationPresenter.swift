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
    func didSuccessAuthorize()
    func didFailAuthorize()
}

final class AuthorizationPresenter {
    
    // MARK: - Properties
    
    weak var view: AuthorizationViewInput?
    
    var router: AuthorizationRouterInput?
    var interactor: AuthorizationInteractorInput?
    
}


// MARK: - AuthorizationViewOutput
extension AuthorizationPresenter: AuthorizationViewOutput {
    
    func viewIsReady() {
        
        // MARK: - MOCK
        let viewModel = AuthorizationViewModel(mainTitle: "Authorization screen", confirmButtonTitle: "Login", forgotPassButtonTitle: "Forgot password?")
        view?.update(with: viewModel)
    }
    
    func didTapConfirmButton(email: String?, password: String?) {
        view?.showHUD()
        interactor?.tryToSignIn(email: email ?? "", password: password ?? "")
    }
    
    func didTapForgotPasswordButton() {
        
        // ...
    }
    
}


// MARK: AuthorizationInteractorOutput
extension AuthorizationPresenter: AuthorizationInteractorOutput {
    
    func didSuccessAuthorize() {
        view?.hideHUD()
        router?.openMainScreen()
    }
    
    func didFailAuthorize() {
        view?.hideHUD()
        view?.showErrorAlert()
    }

}
