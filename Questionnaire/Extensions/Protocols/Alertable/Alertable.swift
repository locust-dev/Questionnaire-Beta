//
//  Alertable.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import UIKit

protocol Alertable: AnyObject {
    
    func showAlert(title: String?,
                   message: String?,
                   buttonTitle: String?)
    
}


// MARK: - Default implementation
extension Alertable where Self: UIViewController {
    
    func showAlert(title: String?, message: String? = nil, buttonTitle: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: buttonTitle, style: .cancel))
        present(alert, animated: true)
    }
    
}
