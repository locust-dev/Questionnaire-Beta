//
//  TestCategoriesViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestCategoriesViewInput: Loadable, Alertable, Errorable {
    func update(with viewModel: TestCategoriesViewModel)
    func showNonAuthorizedAlert()
}

final class TestCategoriesViewController: UIViewController {
	
    // MARK: - Properties
    
	var presenter: TestCategoriesViewOutput?
    var tableViewManager: TestCategoriesTableViewManagerInput?
    
    private let tableView = EmptyTableView()
    
    
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


// MARK: - TestCategoriesViewInput
extension TestCategoriesViewController: TestCategoriesViewInput {
    
    func update(with viewModel: TestCategoriesViewModel) {
        tableViewManager?.update(with: viewModel)
    }
    
    func showNonAuthorizedAlert() {
        // TODO: - From config
        showAlert(title: "Oops", message: "You must be authorized!", buttonTitle: "Ok")
    }
}
