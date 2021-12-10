//
//  TestsAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

final class TestsAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model else {
            fatalError("Wrong model for TestsModule")
        }
        
        let view = TestsViewController()
        let router = TestsRouter(transition: view)
        let presenter = TestsPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        view.tabBarItem.title = model.tabBarTitle
        view.tabBarItem.image = Images.tabbar_tests()
        
        return view
    }

}


// MARK: - Model
extension TestsAssembly {
    
    struct Model: TransitionModel {
        
        let tabBarTitle: String
    }
}
