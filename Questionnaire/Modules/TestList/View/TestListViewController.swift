//
//  TestListViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestListViewInput: Loadable, Alertable {
    func update(with viewModel: TestListViewModel)
    func showAlertIfNoQuestionsInTest()
    func showAlertSureToStartTest(_ test: Test)
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
    
    func showAlertIfNoQuestionsInTest() {
        // TODO: - Config
        showAlert(title: "Ошибка",
                  message: "Похоже, в этот тест еще не добавили ни одного вопроса!",
                  buttonTitle: "Ок")
    }
    
    func showAlertSureToStartTest(_ test: Test) {
        
        let okAction = AlertAction(title: "Начать", style: .default) {
            self.presenter?.didTapStartTest(test)
        }
        
        let cancelAction = AlertAction(title: "Отменить", style: .cancel)
        showAlert(title: "Начать тест?", message: "Вы уверены?", actions: [okAction, cancelAction])
    }

}
