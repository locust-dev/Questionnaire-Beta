//
//  TestsDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestsDataConverterInput {
    func convert(tests: TestsModel) -> TestsViewModel
}

final class TestsDataConverter {
    
    // MARK: - Types
    
    typealias TestCellConfigurator = TableCellConfigurator<TestCell, TestCell.Model>
    
    
    // MARK: - Private methods

    private func createTestRow(test: Test) -> TestsViewModel.Row {

        let model = TestCell.Model(testName: test.testName)
        let configurator = TestCellConfigurator(item: model)
        return TestsViewModel.Row(configurator: configurator)
    }
}


// MARK: - TestsDataConverterInput
extension TestsDataConverter: TestsDataConverterInput {
    
    func convert(tests: TestsModel) -> TestsViewModel {
        let rows = tests.each.map { createTestRow(test: $0) }
        return TestsViewModel(rows: rows)
    }
    
}
