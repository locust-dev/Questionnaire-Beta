//
//  TestCategoryCell.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import UIKit

final class TestCategoryCell: UITableViewCell {
    
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
extension TestCategoryCell: Configurable {
    
    struct Model {
        
        let name: String
    }
    
    func configure(with model: Model) {
        
        nameLabel.text = model.name
    }
}
