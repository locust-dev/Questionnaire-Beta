//
//  MainScreenViewController.swift
//  Questionnaire
//
//  Created Ilya Turin on 09.12.2021.
//  Copyright © 2021 FINCH. All rights reserved.
//

import UIKit

protocol MainScreenViewInput: AnyObject {
    func set(viewControllers: [UIViewController]?)
    func updateProfileTabUsername(_ username: String)
}

final class MainScreenViewController: UITabBarController {
    
    // MARK: - Properties
    
    var presenter: MainScreenViewOutput?
    
    private var isFirstLoaded = true
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFirstLoaded {
            presenter?.viewWillAppear()
            isFirstLoaded = false
        }
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
            
        view.backgroundColor = .white
        
        tabBar.isHidden = true
        tabBar.isTranslucent = false
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
    
}


// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    
    func set(viewControllers: [UIViewController]?) {
        tabBar.isHidden = false
        self.viewControllers = viewControllers
    }
    
    func updateProfileTabUsername(_ username: String) {
        
        guard let viewControllers = viewControllers else {
            return
        }
        
        for viewController in viewControllers {
            let profileVC = (viewController as? UINavigationController)?.topViewController as? ProfileViewController
            profileVC?.tabBarItem.title = username
        }
    }
    
}
