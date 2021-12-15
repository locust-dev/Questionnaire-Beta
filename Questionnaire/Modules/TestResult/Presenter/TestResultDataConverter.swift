//
//  TestResultDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import Foundation

protocol TestResultDataConverterInput {
    func convert(rightAnswers: RightAnswersModel, userAnswers: [Int: Int]) -> TestResultViewModel
}

final class TestResultDataConverter {
    
    // MARK: - Properties
    
    let numberFormatter = NumberFormatter()
    
    
    // MARK: - Private methods
    
    private func convertToPercent(_ number: Float) -> String? {
        numberFormatter.numberStyle = .percent
        return numberFormatter.string(from: NSNumber(value: number))
    }

}


// MARK: - TestResultDataConverterInput
extension TestResultDataConverter: TestResultDataConverterInput {
  
    func convert(rightAnswers: RightAnswersModel, userAnswers: [Int : Int]) -> TestResultViewModel {
        
        var matches = 0
        var questionWithMistakes = [Int]()
        
        userAnswers.forEach { (questionNumber, userAnswer) in
            if rightAnswers.each[questionNumber - 1] == userAnswer {
                matches += 1
            } else {
                questionWithMistakes.append(questionNumber)
            }
        }
        
        let percentString = convertToPercent(Float(matches) / Float(rightAnswers.each.count))
        
        // TODO: - Localized
        return TestResultViewModel(percentage: percentString,
                                   questionsWithMistakes: questionWithMistakes,
                                   quitButtonTitle: "Finish test")
    }
    
}
