//
//  TestCategoriesDataConverter.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

protocol TestCategoriesDataConverterInput: AnyObject {
    func convert(categories: [String]) -> TestCategoriesViewModel
}

final class TestCategoriesDataConverter {
    
    // MARK: - Types
    
    typealias CategoryCellConfigurator = TableCellConfigurator<TestCategoryCell, TestCategoryCell.Model>
    
    
    // MARK: - Private methods

    private func createCategoryRow(category: String) -> TestCategoriesViewModel.Row {

        let model = TestCategoryCell.Model(name: category)
        let configurator = CategoryCellConfigurator(item: model)
        return TestCategoriesViewModel.Row(configurator: configurator)
    }
}


// MARK: - TestCategoriesDataConverterInput
extension TestCategoriesDataConverter: TestCategoriesDataConverterInput {
    
    func convert(categories: [String]) -> TestCategoriesViewModel {
        
        let rows = categories.map { createCategoryRow(category: $0) }
        
        return TestCategoriesViewModel.init(rows: rows)
    }
    
}
