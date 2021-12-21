//
//  ProgressHUD.swift
//  Questionnaire
//
//  Created by Ilya Turin on 10.12.2021.
//

import UIKit
import SVProgressHUD

final class ProgressHUD: SVIndefiniteAnimatedView {
    
    // MARK: - Private Properties
    
    var color: UIColor {
        didSet {
            strokeColor = color
        }
    }
    
    private let size: ProgressHUDSize
    
    
    // MARK: - Init
    
    init(size: ProgressHUDSize = .big, color: UIColor = .white) {
        self.size = size
        self.color = color
        super.init(frame: CGRect.zero)
        drawSelf()
    }

    required init?(coder aDecoder: NSCoder) {
        size = .big
        color = .white
        super.init(coder: aDecoder)
        drawSelf()
    }
    
    
    // MARK: - Private Methods

    private func drawSelf() {
        radius = size.radius
        strokeThickness = size.stroke
        strokeColor = color
    }
    
}
