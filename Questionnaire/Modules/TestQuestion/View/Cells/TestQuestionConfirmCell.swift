//
//  TestQuestionConfirmCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class TestQuestionConfirmCell: NLTableViewCell, Delegatable {
    
    // MARK: - Properties
    
    var delegate: AnyObject?
    
    private let confirmButton = CommonButton(style: .reversedFilled)
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }

    
    // MARK: - Drawing
    
    private func drawSelf() {
    
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        confirmButton.addTarget(self, action: #selector(confirmTap), for: .touchUpInside)
        
        contentView.addSubview(confirmButton)
        confirmButton.autoSetDimension(.height, toSize: 50)
        confirmButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    
    // MARK: - Actions
    
    @objc private func confirmTap() {
        (delegate as? TestQuestionTableViewManagerDelegate)?.didTapConfirmButton()
    }
}


// MARK: - Configurable
extension TestQuestionConfirmCell: Configurable {
    
    struct Model {
        
        let title: String
    }
    
    func configure(with model: Model) {
        
        confirmButton.setTitle(model.title, for: .normal)
    }
}
