//
//  TestsViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestsViewInput: AnyObject {  }

final class TestsViewController: UIViewController {
	
    // MARK: - Properties
    
	var presenter: TestsViewOutput?
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        view.backgroundColor = .green
    }
    
}


// MARK: - TestsViewInput
extension TestsViewController: TestsViewInput {
    
}
