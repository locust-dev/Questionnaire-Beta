//
//  TestCategoriesDataConverter.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

protocol TestCategoriesDataConverterInput: AnyObject {
    func convert(categories: [TestCategoryModel]) -> TestCategoriesViewModel
}

final class TestCategoriesDataConverter {
    
    // MARK: - Types
    
    typealias CategoryCellConfigurator = TableCellConfigurator<TestCategoryCell, TestCategoryCell.Model>
    
    
    // MARK: - Private methods

    private func createCategoryRow(category: TestCategoryModel) -> TestCategoriesViewModel.Row {

        let model = TestCategoryCell.Model(name: category.fullTitle)
        let configurator = CategoryCellConfigurator(item: model)
        return TestCategoriesViewModel.Row(configurator: configurator, categoryId: category.identifier)
    }
}


// MARK: - TestCategoriesDataConverterInput
extension TestCategoriesDataConverter: TestCategoriesDataConverterInput {
    
    func convert(categories: [TestCategoryModel]) -> TestCategoriesViewModel {
        let rows = categories.map { createCategoryRow(category: $0) }
        return TestCategoriesViewModel(rows: rows)
    }
    
}
