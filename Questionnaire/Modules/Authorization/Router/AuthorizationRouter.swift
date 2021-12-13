//
//  AuthorizationRouter.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol AuthorizationRouterInput {
    //func openProfile(with userModel: AuthorizedUserModel)
}

final class AuthorizationRouter {
    
    // MARK: - Properties
    
    private unowned let transition: ModuleTransitionHandler
    
    
    // MARK: - Init
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
    
}


// MARK: - AuthorizationRouterInput
extension AuthorizationRouter: AuthorizationRouterInput {
    
//    func openProfile(with userModel: AuthorizedUserModel) {
//
//        let profileModel = ProfileAssembly.Model(username: userModel.username,
//                                                 userID: userModel.userID)
//
//        transition.push(with: profileModel, openModuleType: ProfileAssembly.self)
//    }
}
