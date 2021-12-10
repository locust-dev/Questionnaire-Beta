//
//  TestsPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestsViewOutput: ViewOutput {  }

final class TestsPresenter {
    
    // MARK: - Properties
    
    weak var view: TestsViewInput?
    
    var router: TestsRouterInput?
    
}


// MARK: - TestsViewOutput
extension TestsPresenter: TestsViewOutput {
    
    func viewIsReady() {  }
    
}
