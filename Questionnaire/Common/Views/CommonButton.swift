//
//  CommonButton.swift
//  Questionnaire
//
//  Created by Ilya Turin on 18.12.2021.
//

import UIKit

final class CommonButton: NLButton {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        layer.cornerRadius = 10
        backgroundColor = Colors.mainBlueColor()
        
        titleLabel?.font = UIFont(name: MainFont.bold, size: 16)
    }
}
