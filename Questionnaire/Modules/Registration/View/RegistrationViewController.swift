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
    
    private let mainLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let firstNameTextField = BottomLineTextField()
    private let lastNameTextField = BottomLineTextField()
    private let registerButton = CommonButton()
    private let stack = UIStackView()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawning
    
    private func drawSelf() {
         
        view.backgroundColor = Colors.mainBlueColor()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        firstNameTextField.type = .firstName
        lastNameTextField.type = .lastName
        
        mainLabel.font = UIFont(name: MainFont.bold, size: 30)
        mainLabel.textColor = .black
        mainLabel.numberOfLines = 0
        mainLabel.text = "Регистрация"
        
        subtitleLabel.font = UIFont(name: MainFont.regular, size: 16)
        subtitleLabel.textColor = .black
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Вы успешно авторизовались, но, для продолжения, вам необходимо зарегистрироваться"
        
        // TODO: - Localized
        registerButton.setTitle("Зарегистрироваться", for: .normal)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        let stackContainer = UIView()
        stackContainer.backgroundColor = .white
        stackContainer.layer.cornerRadius = 12
        
        let appIconContainer = UIView()
        let appIconImageView = UIImageView(image: Images.mainIcon())
        appIconImageView.contentMode = .scaleAspectFit
        
        stack.addArrangedSubviews([mainLabel,
                                   subtitleLabel,
                                   firstNameTextField,
                                   lastNameTextField,
                                   registerButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.setCustomSpacing(4, after: mainLabel)
        stack.setCustomSpacing(40, after: lastNameTextField)

        view.addSubview(stackContainer)
        stackContainer.addSubview(stack)
        view.addSubview(appIconContainer)
        appIconContainer.addSubview(appIconImageView)
        
        stackContainer.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: -30, right: 0), excludingEdge: .top)
        stack.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 40, left: 20, bottom: 80, right: 20))
        
        appIconContainer.autoPinEdge(.bottom, to: .top, of: stackContainer)
        appIconContainer.autoPinEdgesToSuperviewEdges(
            with: UIEdgeInsets(top: getStatusBarHeight(), left: 0, bottom: 0, right: 0),
            excludingEdge: .bottom
        )
        
        appIconImageView.autoCenterInSuperview()
        appIconImageView.autoSetDimensions(to: CGSize(width: 70, height: 70))
        
        firstNameTextField.autoSetDimension(.height, toSize: 50)
        lastNameTextField.autoSetDimension(.height, toSize: 50)
        registerButton.autoSetDimension(.height, toSize: 50)
    }
    
    
    // MARK: - Actions
    
    @objc private func register() {
        presenter?.didTapRegisterButton(firstName: firstNameTextField.text,
                                        lastName: lastNameTextField.text)
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
