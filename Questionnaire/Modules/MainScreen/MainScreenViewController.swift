//
//  MainScreenViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol MainScreenViewInput: AnyObject {  }

final class MainScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: MainScreenViewOutput?
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        view.backgroundColor = .blue
    }
    
}


// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    
}
