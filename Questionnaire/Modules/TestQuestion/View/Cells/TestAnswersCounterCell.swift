//
//  TestAnswersCounterCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class TestAnswersCounterCell: UITableViewCell, Delegatable {
    
    
    // MARK: - Properties
    
    var delegate: AnyObject?
    
    private let answersStack = UIStackView()
 
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
    
        contentView.backgroundColor = .lightGray
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.blue.cgColor
        
        answersStack.axis = .vertical
        answersStack.spacing = 20
        answersStack.distribution = .fillEqually
        
        contentView.addSubview(answersStack)
        answersStack.autoPinEdgesToSuperviewEdges()
    }
    
    
    // MARK: - Private methods
    
    private func setAllButtonsUnselected() {
        answersStack.subviews.forEach { view in
            if let button = view as? UIButton {
                button.isSelected = false
            }
        }
    }
    
    
    // MARK: - Actions
    
    @objc private func selectAnswer(sender: AnswerButton) {
        setAllButtonsUnselected()
        sender.isSelected = true
        (delegate as? TestQuestionTableViewManagerDelegate)?.didSelectAnswer(by: sender.answerCount)
    }
}


// MARK: - Configurable
extension TestAnswersCounterCell: Configurable {
    
    struct Model {
        
        let answers: [String]
    }
    
    func configure(with model: Model) {
        
        answersStack.removeAllArrangedSubviewsFully()
        
        model.answers.enumerated().forEach { (index, title) in
            let answerButton = AnswerButton(answerCount: index + 1, title: title)
            answerButton.addTarget(self, action: #selector(selectAnswer), for: .touchUpInside)
            answersStack.addArrangedSubview(answerButton)
        }
    }
}
