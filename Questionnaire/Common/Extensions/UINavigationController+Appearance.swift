//
//  UINavigationController+Appearance.swift
//  Questionnaire
//
//  Created by Ilya Turin on 20.12.2021.
//

import UIKit

extension UINavigationController {
    
    func setBackButtonDesign() {
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().backIndicatorImage = Images.arrow()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = Images.arrow()
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -5), for: .default)
    }
    
}
