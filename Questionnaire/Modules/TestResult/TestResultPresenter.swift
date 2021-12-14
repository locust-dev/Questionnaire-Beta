//
//  TestResultPresenter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestResultViewOutput: ViewOutput {  }

protocol TestResultInteractorOutput: AnyObject {  }

final class TestResultPresenter {
    
    // MARK: - Properties
    
    weak var view: TestResultViewInput?
    
    var router: TestResultRouterInput?

    private let dataConverter: TestResultDataConverterInput
    private let userAnswers: [Int: Int]
    
    
    // MARK: - Init
    
    init(dataConverter: TestResultDataConverterInput,
         userAnswers: [Int: Int]) {
        
        self.dataConverter = dataConverter
        self.userAnswers = userAnswers
    }
    
}


// MARK: - TestResultViewOutput
extension TestResultPresenter: TestResultViewOutput {
    
    func viewIsReady() {
        view?.showHUD()
    }
    
}


// MARK: - TestResultInteractorOutput
extension TestResultPresenter: TestResultInteractorOutput {  }


// MARK: - TestResultTableViewManagerDelegate
extension TestResultPresenter: TestResultTableViewManagerDelegate {  }
