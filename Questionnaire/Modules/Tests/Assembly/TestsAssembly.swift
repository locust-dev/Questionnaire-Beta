//
//  TestsAssembly.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

final class TestsAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model else {
            fatalError("Wrong model for TestsModule")
        }
        
        let databaseService = FBDatabaseService()
        
        let tableViewManager = TestsTableViewManager()
        let dataConverter = TestsDataConverter()
        
        let interactor = TestsInteractor(databaseService: databaseService)
        let view = TestsViewController()
        let router = TestsRouter(transition: view)
        let presenter = TestsPresenter(dataConverter: dataConverter, categoryId: model.categoryId)
        
        tableViewManager.delegate = presenter
        
        view.presenter = presenter
        view.tableViewManager = tableViewManager
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }

}


// MARK: - Model
extension TestsAssembly {
    
    struct Model: TransitionModel {
        
        let categoryId: String
    }
    
}
