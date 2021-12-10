//
//  FirebaseAuthService.swift
//  Questionnaire
//
//  Created by Ilya Turin on 10.12.2021.
//

import FirebaseAuth

protocol FirebaseAuthServiceProtocol {
    
    var isAuthorized: Bool { get }
    
    func signIn(email: String, password: String, completion: @escaping (Result<Any, Error>) -> Void)
}

final class FirebaseAuthService {
    
    // MARK: - Private methods
    
    private func storeUserId(_ userId: String?) {
        
        guard let userId = userId else {
            return
        }
        
        UserDefaults.standard.set(userId, forKey: FirebaseUDKeys.userId.rawValue)
    }
    
}


// MARK: - FirebaseAuthServiceProtocol
extension FirebaseAuthService: FirebaseAuthServiceProtocol {
    
    var isAuthorized: Bool {
        return true
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<Any, Error>) -> Void) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // TODO: - Return user infos
            completion(.success(result?.user as Any))
            self?.storeUserId(result?.user.uid)
        }
    }
}
