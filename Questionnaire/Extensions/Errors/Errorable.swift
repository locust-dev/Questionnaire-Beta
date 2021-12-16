//
//  Errorable.swift
//  Questionnaire
//
//  Created by Ilya Turin on 16.12.2021.
//

import UIKit

protocol Errorable: AnyObject {
    
    func showErrorPlaceholder(_ error: ErrorModel)
}


// MARK: - Default implementation
extension Errorable where Self: UIViewController {
    
    func showErrorPlaceholder(_ error: ErrorModel) {
        
        view.backgroundColor = .white
        
        let errorPlaceholeder = ErrorPlaceholder(error: error)
        errorPlaceholeder.delegate = self
    
        view.addSubview(errorPlaceholeder)
        errorPlaceholeder.autoPinEdgesToSuperviewSafeArea()
    }
    
}

extension UIViewController: Errorable {}
