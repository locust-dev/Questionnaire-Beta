//
//  AuthorizationInteractor.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol AuthorizationInteractorInput {
    func tryToSignIn(email: String, password: String)
}

final class AuthorizationInteractor {
    
    // MARK: - Properties
    
    weak var presenter: AuthorizationInteractorOutput?
    
    private let authorizationService: FirebaseAuthServiceProtocol
    
    
    // MARK: - Init
    
    init(authorizationService: FirebaseAuthServiceProtocol) {
        self.authorizationService = authorizationService
    }
    
}


// MARK: - MainScreenInteractorInput
extension AuthorizationInteractor: AuthorizationInteractorInput {
    
    func tryToSignIn(email: String, password: String) {
        authorizationService.signIn(email: email, password: password) { result in
            
            switch result {
            case .success(let userData):
                let userModel = AuthorizedUserModel(username: userData?.description.description ?? "Deafult", userID: userData?.user.uid ?? "111")
                self.presenter?.didSuccessAuthorize(userModel: userModel)
                
            case .failure(_):
                self.presenter?.didFailAuthorize()
            }
        }
    }
}
