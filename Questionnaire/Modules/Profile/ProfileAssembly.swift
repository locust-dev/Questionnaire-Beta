//
//  ProfileAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

final class ProfileAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model else {
            fatalError("Wrong model for ProfileModule")
        }
        
        let view = ProfileViewController()
        let router = ProfileRouter(transition: view)
        let presenter = ProfilePresenter(username: model.username, userID: model.userID, moduleOutput: model.moduleOutput)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        view.tabBarItem.title = model.tabBarTitle
        view.tabBarItem.image = Images.tabbar_profile()
        
        return UINavigationController(rootViewController: view)
    }

}


// MARK: - Model
extension ProfileAssembly {
    
    struct Model: TransitionModel {
        
        weak var moduleOutput: ProfileModuleOutput?
        
        let tabBarTitle: String
        let username: String
        let userID: String
    }
    
}
