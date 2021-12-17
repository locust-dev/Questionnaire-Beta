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
    
    private let logOutButton = UIButton()
    
    
    // MARK: - Life cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
        presenter?.viewIsReady()
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        logOutButton.addTarget(self, action: #selector(logOutTap), for: .touchUpInside)
        logOutButton.layer.cornerRadius = 15
        logOutButton.backgroundColor = .lightGray
        logOutButton.layer.borderColor = UIColor.darkGray.cgColor
        logOutButton.layer.borderWidth = 1
        
        view.addSubview(logOutButton)
        
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
        
        title = viewModel.fullName
        
        // TODO: - From localized
        logOutButton.setTitle("Log out", for: .normal)
    }
}
