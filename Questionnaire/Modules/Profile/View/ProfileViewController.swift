//
//  ProfileViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 10.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol ProfileViewInput: Loadable, Alertable  {
    func update(with viewModel: ProfileViewModel)
}

final class ProfileViewController: UIViewController {
	
    // MARK: - Properties
    
	var presenter: ProfileViewOutput?
    
    private let logOutButton = CommonButton(style: .filled)
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        view.backgroundColor = .white
        
        logOutButton.addTarget(self, action: #selector(logOutTap), for: .touchUpInside)
        
        view.addSubview(logOutButton)
        
        logOutButton.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), excludingEdge: .top)
       
    }
    
    
    // MARK: - Actions
    
    @objc private func logOutTap() {
        presenter?.didTapLogOutButton()
    }
    
}


// MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    
    func update(with viewModel: ProfileViewModel) {
        
        title = viewModel.fullName
        
        // TODO: - From localized
        logOutButton.setTitle("Выйти", for: .normal)
    }
}
