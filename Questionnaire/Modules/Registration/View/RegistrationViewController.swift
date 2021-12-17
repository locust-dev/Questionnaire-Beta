//
//  RegistrationViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 15.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol RegistrationViewInput: Alertable, Loadable {
    func showAlertNonOptionalFields()
    func showSavingAlertError(message: String)
    func showSuccessRegistrationAlert()
}

final class RegistrationViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: RegistrationViewOutput?
    
    private let firstNameTextField = UITextField()
    private let lastNameTextField = UITextField()
    private let registerButton = UIButton()
    private let stack = UIStackView()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawning
    
    private func drawSelf() {
        
        view.backgroundColor = .blue
        
        // TODO: - Localized
        firstNameTextField.placeholder = "Имя"
        lastNameTextField.placeholder = "Фамилия"
        registerButton.setTitle("Зарегистрироваться", for: .normal)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        stack.addArrangedSubviews([firstNameTextField,
                                   lastNameTextField,
                                   registerButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        
        configureTextFieldAppearance()
        
        view.addSubview(stack)
        firstNameTextField.autoSetDimension(.height, toSize: 50)
        stack.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                                              excludingEdge: .bottom)
    }
    
    
    // MARK: - Actions
    
    @objc private func register() {
        presenter?.didTapRegisterButton(firstName: firstNameTextField.text,
                                        lastName: lastNameTextField.text)
    }
    
    
    // MARK: - Private methods
    
    private func configureTextFieldAppearance() {
        stack.arrangedSubviews.forEach({
            if let textField = $0 as? UITextField {
                textField.backgroundColor = .white
            }
        })
    }
    
}


// MARK: - RegistrationViewInput
extension RegistrationViewController: RegistrationViewInput {
    
    func showAlertNonOptionalFields() {
        // TODO: - Localized
        showAlert(title: "Ошибка!", message: "Пожалуйста, заполните все обязятельные поля.")
    }
    
    func showSavingAlertError(message: String) {
        // TODO: - Localized
        showAlert(title: "Ошибка!", message: message)
    }
    
    func showSuccessRegistrationAlert() {
        // TODO: - Localized
        showAlert(title: "Ура!", message: "Вы зарегистрированы. Теперь вы можете проходить тесты.")
    }

}
