//
//  AuthorizationViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import PureLayout
import UIKit

protocol AuthorizationViewInput: AnyObject {
    func update(with viewModel: AuthorizationViewModel)
}

final class AuthorizationViewController: UIViewController {
	
    // MARK: - Public properties
    
	var presenter: AuthorizationViewOutput?
    
    private let mainLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmButton = UIButton()
    private let forgotPasswordButton = UIButton()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawning
    
    private func drawSelf() {
        
        view.backgroundColor = Colors.authBackground()
        
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        
        loginTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
        
        view.addSubview(mainLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmButton)
        view.addSubview(forgotPasswordButton)
        
        mainLabel.autoPinEdge(.top, to: .top, of: view, withOffset: 100)
        mainLabel.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        mainLabel.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        
        loginTextField.autoPinEdge(.top, to: .bottom, of: mainLabel, withOffset: 100)
        loginTextField.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        loginTextField.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        loginTextField.autoSetDimension(.height, toSize: 50)
        
        passwordTextField.autoPinEdge(.top, to: .bottom, of: loginTextField, withOffset: 30)
        passwordTextField.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        passwordTextField.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        passwordTextField.autoSetDimension(.height, toSize: 50)
        
        confirmButton.autoSetDimension(.height, toSize: 50)
        confirmButton.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        confirmButton.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        confirmButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 50)
        confirmButton.autoAlignAxis(toSuperviewAxis: .vertical)
        
        forgotPasswordButton.autoSetDimension(.height, toSize: 50)
        forgotPasswordButton.autoPinEdge(.left, to: .left, of: view, withOffset: 20)
        forgotPasswordButton.autoPinEdge(.right, to: .right, of: view, withOffset: -20)
        forgotPasswordButton.autoPinEdge(.top, to: .bottom, of: confirmButton, withOffset: 20)
        forgotPasswordButton.autoAlignAxis(toSuperviewAxis: .vertical)
    }
    
}


// MARK: - AuthorizationViewInput
extension AuthorizationViewController: AuthorizationViewInput {
    
    func update(with viewModel: AuthorizationViewModel) {
        mainLabel.text = viewModel.mainTitle
        confirmButton.setTitle(viewModel.confirmButtonTitle, for: .normal)
        forgotPasswordButton.setTitle(viewModel.forgotPassButtonTitle, for: .normal)
    }
}
