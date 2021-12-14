//
//  TestCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class TestCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let nameLabel = UILabel()
    
    
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
        
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        
        contentView.addSubview(nameLabel)
        nameLabel.autoPinEdgesToSuperviewEdges()
    }
    
    
}


// MARK: - Configurable
extension TestCell: Configurable {
    
    struct Model {
        
        let testName: String
    }
    
    func configure(with model: Model) {
        
        nameLabel.text = model.testName
    }
}
