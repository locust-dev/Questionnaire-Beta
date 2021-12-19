//
//  TestQuestionFinishTestCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 19.12.2021.
//

import UIKit

final class TestQuestionFinishTestCell: NLTableViewCell, Delegatable {
    
    // MARK: - Properties
    
    var delegate: AnyObject?
    
    private let finishButton = CommonButton(style: .reversedShadow)
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }

    
    // MARK: - Drawing
    
    private func drawSelf() {
    
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        finishButton.addTarget(self, action: #selector(finishTap), for: .touchUpInside)
        
        contentView.addSubview(finishButton)
        finishButton.autoSetDimension(.height, toSize: 50)
        finishButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20))
    }
    
    
    // MARK: - Actions
    
    @objc private func finishTap() {
        
    }
}


// MARK: - Configurable
extension TestQuestionFinishTestCell: Configurable {
    
    struct Model {
        
        let title: String
    }
    
    func configure(with model: Model) {
        
        finishButton.setTitle(model.title, for: .normal)
    }
}
