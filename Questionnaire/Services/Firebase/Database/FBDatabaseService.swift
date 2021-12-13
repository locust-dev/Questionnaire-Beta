//
//  FBDatabaseService.swift
//  Questionnaire
//
//  Created by Ilya Turin on 11.12.2021.
//

import FirebaseDatabase
import Foundation

protocol FBDatabaseServiceProtocol: AnyObject {
    func getData(_ key: FBDatabaseRequestKey, completion: @escaping (Result<Any, ErrorModel>) -> Void)
}

final class FBDatabaseService {
    
    // MARK: - Properties
    
    private let databaseReference = Database.database(url: FBDatabaseReference.realtime.rawValue).reference()
    
}


// MARK: - FirebaseDatabaseServiceProtocol
extension FBDatabaseService: FBDatabaseServiceProtocol {
    
    func getData(_ key: FBDatabaseRequestKey, completion: @escaping (Result<Any, ErrorModel>) -> Void) {
        
        databaseReference.child(key.rawValue).getData { error, data in
              
            guard let value = data.value, error == nil else {
                completion(.failure(.somethingWentWrong))
                return
            }
            
            completion(.success(value))
        }
    }
    
}
