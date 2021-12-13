//
//  FBAuthService.swift
//  Questionnaire
//
//  Created by Ilya Turin on 10.12.2021.
//

import FirebaseAuth

protocol FBAuthServiceProtocol {
    
    var isAuthorized: Bool { get }
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void)
    func logOut()
}

final class FBAuthService {
    
    // MARK: - Types
    
    private enum UserDefaultsKey: String {
        
        case userId
    }
    
    
    // MARK: - Properties
    
    private let userDefaults = UserDefaults.standard
    
    
    // MARK: - Private methods
    
    private func changeCurrentUserToken(_ token: String?) {
        userDefaults.set(token, forKey: UserDefaultsKey.userId.rawValue)
    }
    
}


// MARK: - FirebaseAuthServiceProtocol
extension FBAuthService: FBAuthServiceProtocol {
    
    var isAuthorized: Bool {
        userDefaults.value(forKey: UserDefaultsKey.userId.rawValue) != nil
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // TODO: - Error when server didnt send Token
            self?.changeCurrentUserToken(result?.user.uid)
            completion(.success(result))
        }
    }
    
    func logOut() {
        changeCurrentUserToken(nil)
    }
}
