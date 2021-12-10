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
        
        view.addSubview(username)
        view.addSubview(userInfo)
        
        username.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), excludingEdge: .bottom)
        userInfo.autoPinEdge(.top, to: .bottom, of: username, withOffset: 50)
    }
    
}


// MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    
    func update(with viewModel: ProfileViewModel) {
        
        username.text = viewModel.username
        userInfo.text = viewModel.userID
    }
}
