//
//  TestResultDataConverter.swift
//  Questionnaire
//
//  Created Ilya Turin on 14.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

protocol TestResultDataConverterInput {
    func convert() -> TestResultViewModel?
}

final class TestResultDataConverter {  }


// MARK: - TestResultDataConverterInput
extension TestResultDataConverter: TestResultDataConverterInput {
    
    func convert() -> TestResultViewModel? {
        return nil
    }
    
}
