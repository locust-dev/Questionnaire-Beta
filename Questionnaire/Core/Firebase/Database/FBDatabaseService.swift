//
//  FBDatabaseService.swift
//  Questionnaire
//
//  Created by Ilya Turin on 11.12.2021.
//

import FirebaseDatabase
import Foundation

protocol FBDatabaseServiceProtocol: AnyObject {
    func getData(_ key: FBDatabaseRequestKey, completion: @escaping (Result<Any?, Error>) -> Void)
}

final class FBDatabaseService {
    
    // MARK: - Properties
    
    private let databaseReference = Database.database(url: FBDatabaseReference.realtime.rawValue).reference()
    
}


// MARK: - FirebaseDatabaseServiceProtocol
extension FBDatabaseService: FBDatabaseServiceProtocol {
    
    func getData(_ key: FBDatabaseRequestKey, completion: @escaping (Result<Any?, Error>) -> Void) {
        
        databaseReference.child(key.rawValue).getData { error, data in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success(data.value))
        }
    }
    
}
