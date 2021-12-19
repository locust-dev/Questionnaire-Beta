//
//  TestQuestionViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestQuestionViewInput: Alertable {
    func update(with viewModel: TestQuestionViewModel)
    func showNotConfirmAlert()
}

final class TestQuestionViewController: UIViewController {
	
    // MARK: - Public properties
    
	var presenter: TestQuestionViewOutput?
    var tableViewManager: TestQuestionTableViewManagerInput?
    
    private let tableView = UITableView()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Private Methods
    
    private func drawSelf() {
        
        view.backgroundColor = Colors.mainBlueColor()
    
        tableViewManager?.setup(tableView: tableView)
        
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewSafeArea()
    }
    
}


// MARK: - TestQuestionViewInput
extension TestQuestionViewController: TestQuestionViewInput {
    
    func update(with viewModel: TestQuestionViewModel) {
        title = "Вопрос №\(viewModel.currentQuestionNumber)"
        tableViewManager?.update(with: viewModel)
    }
    
    func showNotConfirmAlert() {
        // TODO: - From localized
        showAlert(title: "Oops", message: "You must choose answer before continue!", buttonTitle: "Ok")
    }

}
