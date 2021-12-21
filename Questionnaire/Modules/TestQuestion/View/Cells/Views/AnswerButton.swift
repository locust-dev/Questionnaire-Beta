//
//  AnswerView.swift
//  Questionnaire
//
//  Created by Ilya Turin on 14.12.2021.
//

import UIKit

final class AnswerButton: CommonButton {
    
    // MARK: - Properties
    
    let answerCount: Int
    
    private let mainTitleLabel = UILabel()
    private let checkmarkImageView = UIImageView()
    
    override var isSelected: Bool {
        didSet {
            setStyle()
        }
    }
    
    
    // MARK: - Init
    
    init(answerCount: Int, title: String) {
        self.answerCount = answerCount
        super.init(frame: .zero)
        mainTitleLabel.text = "\(answerCount). \(title)"
        drawSelf()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        checkmarkImageView.image = Images.reverserDeselectedCircle()
        checkmarkImageView.contentMode = .scaleAspectFit
        
        mainTitleLabel.font = UIFont(name: MainFont.bold, size: 16)
        mainTitleLabel.textColor = Colors.mainBlueColor()
        
        let stack = UIStackView(arrangedSubviews: [mainTitleLabel, checkmarkImageView])
        stack.spacing = 14
        stack.isUserInteractionEnabled = false
        
        addSubview(stack)
        stack.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20))
        checkmarkImageView.autoSetDimensions(to: CGSize(width: 20, height: 20))
    }
    
    private func setStyle() {
        
        switch isSelected {
            
        case true:
            style = .filled
            checkmarkImageView.image = Images.selectedCirlce()
            mainTitleLabel.textColor = .white
            
        case false:
            style = .shadow
            checkmarkImageView.image = Images.reverserDeselectedCircle()
            mainTitleLabel.textColor = Colors.mainBlueColor()
        }
    }
    
}
