//
//  TestQuestionDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestQuestionDataConverterInput {
    func convertQuestion(_ question: Question, currentQuestionNumber: Int) -> TestQuestionViewModel
}

final class TestQuestionDataConverter {
    
    // MARK: - Typealias
    
    typealias TitleCellConfigurator = TableCellConfigurator<TestQuestionTitleCell, TestQuestionTitleCell.Model>
    typealias AnswerCounterCellConfigurator = TableCellConfigurator<TestAnswersCounterCell, TestAnswersCounterCell.Model>
    typealias ConfirmCellConfigurator = TableCellConfigurator<TestQuestionConfirmCell, TestQuestionConfirmCell.Model>
    typealias FinishCellConfigurator = TableCellConfigurator<TestQuestionFinishTestCell, TestQuestionFinishTestCell.Model>
    
    
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
    
    private func createFinishButtonRow(title: String) -> TestQuestionViewModel.Row {
        let model = TestQuestionFinishTestCell.Model(title: title)
        let configurator = FinishCellConfigurator(item: model)
        return .finishButton(configurator)
    }
}


// MARK: - TestQuestionDataConverterInput
extension TestQuestionDataConverter: TestQuestionDataConverterInput {
    
    func convertQuestion(_ question: Question, currentQuestionNumber: Int) -> TestQuestionViewModel {
        
        let titleRow = createTitleRow(title: question.text)
        let answersCounterRow = createAnswerCounterRow(answers: question.answers)
        
        // TODO: - From config
        let confirmRow = createConfirmButtonRow(title: "Подтвердить")
        let finishRow = createFinishButtonRow(title: "Завершить тест")
        
        let rows = [titleRow, answersCounterRow, confirmRow]
        
        return TestQuestionViewModel(rows: rows, currentQuestionNumber: currentQuestionNumber)
    }
    
}
