//
//  TestListDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestListDataConverterInput {
    func convert(tests: [Test], allowedTests: [String]) -> TestListViewModel
}

final class TestListDataConverter {
    
    // MARK: - Types
    
    typealias TestCellConfigurator = TableCellConfigurator<TestCell, TestCell.Model>
    
    
    // MARK: - Private methods

    private func createTestRow(test: Test) -> TestListViewModel.Row {
        let model = TestCell.Model(testName: test.testName ?? "< Test without name >")
        let configurator = TestCellConfigurator(item: model)
        return TestListViewModel.Row(configurator: configurator)
    }
}


// MARK: - TestListDataConverterInput
extension TestListDataConverter: TestListDataConverterInput {
    
    func convert(tests: [Test], allowedTests: [String]) -> TestListViewModel {
        
        let rows: [TestListViewModel.Row] = tests.compactMap { test in
            
            guard allowedTests.filter({ $0 == test.testId }).first != nil else {
                return nil
            }
            
            return createTestRow(test: test)
        }
        
        let tests: [Test] = tests.compactMap { test in
            
            guard allowedTests.filter({ $0 == test.testId }).first != nil else {
                return nil
            }
            
            return test
        }
            
        return TestListViewModel(rows: rows, tests: tests)
    }
    
}
