//
//  TestResultAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

final class TestResultAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model else {
            fatalError("Wrong model for TestResultModule")
        }
        
        let tableViewManager = TestResultTableViewManager()
        let dataConverter = TestResultDataConverter()
        
        let view = TestResultViewController()
        let router = TestResultRouter(transition: view)
        let presenter = TestResultPresenter(dataConverter: dataConverter, userAnswers: model.userAnswers)
        
        tableViewManager.delegate = presenter
        
        view.presenter = presenter
        view.tableViewManager = tableViewManager
        
        presenter.view = view
        presenter.router = router
        
        return view
    }

}


// MARK: - Model
extension TestResultAssembly {
    
    struct Model: TransitionModel {
        
        let userAnswers: [Int: Int]
    }
    
}
