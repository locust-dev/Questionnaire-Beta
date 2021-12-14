//
//  TestsViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestsViewInput: Loadable, AnyObject {
    func update(with viewModel: TestsViewModel)
}

final class TestsViewController: UIViewController {
	
    // MARK: - Public properties
    
	var presenter: TestsViewOutput?
    var tableViewManager: TestsTableViewManagerInput?
    
    private let tableView = UITableView()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        tableViewManager?.setup(tableView: tableView)
        
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewSafeArea()
    }
}


// MARK: - TestsViewInput
extension TestsViewController: TestsViewInput {
    
    func update(with viewModel: TestsViewModel) {
        tableViewManager?.update(with: viewModel)
    }
    
}
