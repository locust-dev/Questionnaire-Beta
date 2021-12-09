//
//  AppDelegate.swift
//  Questionnaire
//
//  Created by Ilya Turin on 08.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootViewController = AuthorizationAssembly.assembleModule()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        
        return true
    }

}

