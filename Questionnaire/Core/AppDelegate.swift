//
//  AppDelegate.swift
//  Questionnaire
//
//  Created by Ilya Turin on 08.12.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        makeRootViewController()
        FirebaseApp.configure()
        
        return true
    }

}


// MARK: - Private methods
extension AppDelegate {
    
    private func makeRootViewController() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootViewController = AuthorizationAssembly.assembleModule()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
}
