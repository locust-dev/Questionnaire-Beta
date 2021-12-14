//
//  TestsTableViewManager.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestsTableViewManagerDelegate: AnyObject {  }

protocol TestsTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with viewModel: TestsViewModel)
}

final class TestsTableViewManager: NSObject {
    
    // MARK: - Properties
    
    weak var delegate: TestsTableViewManagerDelegate?
    
    private weak var tableView: UITableView?
    
    private var viewModel: TestsViewModel?
    
}


// MARK: - TestsTableViewManagerInput
extension TestsTableViewManager: TestsTableViewManagerInput {
    
    func setup(tableView: UITableView) {
        tableView.register(TestCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    func update(with viewModel: TestsViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
}


// MARK: - UITableViewDataSource
extension TestsTableViewManager: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.rows[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath)
        row.configurator.configure(cell: cell)
        return cell
    }
    
}


// MARK: - UITableViewDelegate
extension TestsTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
