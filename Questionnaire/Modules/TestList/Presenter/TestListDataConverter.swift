//
//  TestListDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestListDataConverterInput {
    func convert(tests: TestsModel) -> TestListViewModel
}

final class TestListDataConverter {
    
    // MARK: - Types
    
    typealias TestCellConfigurator = TableCellConfigurator<TestCell, TestCell.Model>
    
    
    // MARK: - Private methods

    private func createTestRow(test: Test) -> TestListViewModel.Row {

        let model = TestCell.Model(testName: test.testName)
        let configurator = TestCellConfigurator(item: model)
        return TestListViewModel.Row(configurator: configurator)
    }
}


// MARK: - TestListDataConverterInput
extension TestListDataConverter: TestListDataConverterInput {
    
    func convert(tests: TestsModel) -> TestListViewModel {
        let rows = tests.each.map { createTestRow(test: $0) }
        return TestListViewModel(rows: rows, tests: tests.each)
    }
    
}
