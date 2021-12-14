//
//  TestResultViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestResultViewInput: AnyObject, Loadable {  }

final class TestResultViewController: UIViewController {
	
    // MARK: - Public properties
    
	var presenter: TestResultViewOutput?
    var tableViewManager: TestResultTableViewManagerInput?
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Private Methods
    
    private func drawSelf() {  }
}


// MARK: - TestResultViewInput
extension TestResultViewController: TestResultViewInput {
    
}
