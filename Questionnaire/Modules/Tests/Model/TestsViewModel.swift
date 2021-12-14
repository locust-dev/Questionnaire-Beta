//
//  TestsViewModel.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

struct TestsViewModel {
    
    // MARK: - Properties
    
    let rows: [Row]
    
    
    // MARK: - Row
    
    struct Row {
        
        // MARK: - Properties
        
        var identifier: String {
            type(of: configurator).reuseId
        }
        
        var configurator: TableCellConfiguratorProtocol
        
    }
    
}
