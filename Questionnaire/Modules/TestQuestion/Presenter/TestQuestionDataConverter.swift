//
//  TestQuestionDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestQuestionDataConverterInput {
    func convertQuestion(_ question: Question) -> TestQuestionViewModel
}

final class TestQuestionDataConverter {
    
    // MARK: - Typealias
    
    typealias TitleCellConfigurator = TableCellConfigurator<TestQuestionTitleCell, TestQuestionTitleCell.Model>
    typealias AnswerCounterCellConfigurator = TableCellConfigurator<TestAnswersCounterCell, TestAnswersCounterCell.Model>
    typealias ConfirmCellConfigurator = TableCellConfigurator<TestQuestionConfirmCell, TestQuestionConfirmCell.Model>
    
    
    // MARK: - Private methods
    
    private func createTitleRow(title: String) -> TestQuestionViewModel.Row {
        let model = TestQuestionTitleCell.Model(title: title)
        let configurator = TitleCellConfigurator(item: model)
        return .title(configurator)
    }
    
    private func createAnswerCounterRow(answers: [String]) -> TestQuestionViewModel.Row {
        let model = TestAnswersCounterCell.Model(answers: answers)
        let configurator = AnswerCounterCellConfigurator(item: model)
        return .answerCounter(configurator)
    }
    
    private func createConfirmButtonRow(title: String) -> TestQuestionViewModel.Row {
        let model = TestQuestionConfirmCell.Model(title: title)
        let configurator = ConfirmCellConfigurator(item: model)
        return .confirmButton(configurator)
    }
}


// MARK: - TestQuestionDataConverterInput
extension TestQuestionDataConverter: TestQuestionDataConverterInput {
    
    func convertQuestion(_ question: Question) -> TestQuestionViewModel {
        
        let titleRow = createTitleRow(title: question.text)
        let answersCounterRow = createAnswerCounterRow(answers: question.answers)
        
        // TODO: - From config
        let confirmRow = createConfirmButtonRow(title: "Confirm")
        
        let rows = [titleRow, answersCounterRow, confirmRow]
        
        return TestQuestionViewModel(rows: rows)
    }
    
}
