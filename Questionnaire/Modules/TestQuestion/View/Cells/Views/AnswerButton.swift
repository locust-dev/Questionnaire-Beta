//
//  AnswerView.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class AnswerButton: UIButton {
    
    // MARK: - Properties
    
    let answerCount: Int

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .blue : .lightGray
        }
    }

    
    // MARK: - Init
    
    init(answerCount: Int, title: String) {
        self.answerCount = answerCount
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
