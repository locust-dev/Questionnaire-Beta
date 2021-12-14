//
//  TestQuestionConfirmCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class TestQuestionConfirmCell: UITableViewCell, Delegatable {
    
    // MARK: - Properties
    
    var delegate: AnyObject?
    
    private let confirmButton = UIButton()
    
    
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
        
        confirmButton.addTarget(self, action: #selector(confirmTap), for: .touchUpInside)
        
        contentView.addSubview(confirmButton)
        confirmButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50))
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
