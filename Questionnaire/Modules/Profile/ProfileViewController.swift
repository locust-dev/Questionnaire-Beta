//
//  ProfileViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol ProfileViewInput: AnyObject {
    func update(with viewModel: ProfileViewModel)
}

final class ProfileViewController: UIViewController {
	
    // MARK: - Properties
    
	var presenter: ProfileViewOutput?
    
    private let username = UILabel()
    private let userInfo = UILabel()
    private let logOutButton = UIButton()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        view.backgroundColor = .red
        
        username.numberOfLines = 0
        userInfo.numberOfLines = 0
        
        logOutButton.addTarget(self, action: #selector(logOutTap), for: .touchUpInside)
        logOutButton.layer.cornerRadius = 15
        logOutButton.backgroundColor = .lightGray
        logOutButton.layer.borderColor = UIColor.darkGray.cgColor
        logOutButton.layer.borderWidth = 1
        
        view.addSubview(username)
        view.addSubview(userInfo)
        view.addSubview(logOutButton)
        
        username.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), excludingEdge: .bottom)
        userInfo.autoPinEdge(.top, to: .bottom, of: username, withOffset: 50)
        logOutButton.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: -20)
        logOutButton.autoAlignAxis(toSuperviewAxis: .vertical)
        logOutButton.autoSetDimensions(to: CGSize(width: 150, height: 50))
    }
    
    
    // MARK: - Actions
    
    @objc private func logOutTap() {
        presenter?.didTapLogOutButton()
    }
    
}


// MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    
    func update(with viewModel: ProfileViewModel) {
        
        username.text = viewModel.username
        userInfo.text = viewModel.userID
        
        // TODO: - From localized
        logOutButton.setTitle("Log out", for: .normal)
    }
}
