//
//  TestListViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestListViewInput: Loadable, AnyObject {
    func update(with viewModel: TestListViewModel)
}

final class TestListViewController: UIViewController {
	
    // MARK: - Public properties
    
	var presenter: TestListViewOutput?
    var tableViewManager: TestListTableViewManagerInput?
    
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


// MARK: - TestListViewInput
extension TestListViewController: TestListViewInput {
    
    func update(with viewModel: TestListViewModel) {
        tableViewManager?.update(with: viewModel)
    }
    
}