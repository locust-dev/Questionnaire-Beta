//
//  FirebaseAuthService.swift
//  Questionnaire
//
//  Created by Ilya Turin on 10.12.2021.
//

import FirebaseAuth

protocol FirebaseAuthServiceProtocol {
    
    var isAuthorized: Bool { get }
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void)
}

final class FirebaseAuthService {
    
    // MARK: - Private methods
    
    private func setIsAuthorized(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: FirebaseUDKeys.isAuthorized.rawValue)
    }
    
}


// MARK: - FirebaseAuthServiceProtocol
extension FirebaseAuthService: FirebaseAuthServiceProtocol {
    
    var isAuthorized: Bool {
        UserDefaults.standard.bool(forKey: FirebaseUDKeys.isAuthorized.rawValue)
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            self?.setIsAuthorized(true)
            completion(.success(result))
        }
    }
}
