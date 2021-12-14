//
//  TestResultTableViewManager.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol TestResultTableViewManagerDelegate: AnyObject {  }

protocol TestResultTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with viewModel: TestResultViewModel)
}

final class TestResultTableViewManager: NSObject {
    
    // MARK: - Properties
    
    weak var delegate: TestResultTableViewManagerDelegate?
    
    private weak var tableView: UITableView?
    
    private var viewModel: TestResultViewModel?
    
}


// MARK: - TestResultTableViewManagerInput
extension TestResultTableViewManager: TestResultTableViewManagerInput {
    
    func setup(tableView: UITableView) {
        
        // Configure your table view here
        //
        //        tableView.delegate = self
        //        tableView.dataSource = self
        
        //...
        
        self.tableView = tableView
    }
    
    func update(with viewModel: TestResultViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
}


// MARK: - UITableViewDataSource
extension TestResultTableViewManager: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}


// MARK: - UITableViewDelegate
//extension TestResultTableViewManager: UITableViewDelegate {  }
