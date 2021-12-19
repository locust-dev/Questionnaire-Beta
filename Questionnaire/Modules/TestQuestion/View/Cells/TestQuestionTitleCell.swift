//
//  TestQuestionTitleCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class TestQuestionTitleCell: NLTableViewCell {
    
    // MARK: - Properties
    
    private let titleLabel = UILabel()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: MainFont.regular, size: 18)
        titleLabel.textColor = .black
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20))
        titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 10))
    }
    
    
}


// MARK: - Configurable
extension TestQuestionTitleCell: Configurable {
    
    struct Model {
        
        let title: String
    }
    
    func configure(with model: Model) {
        
        titleLabel.text = "Харрис назвала неправильными утверждения, что ВОЗ лицензирует препараты исключительно западного производства?"
    }
}
