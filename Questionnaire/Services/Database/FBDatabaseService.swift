//
//  FBDatabaseService.swift
//  Questionnaire
//
//  Created by Ilya Turin on 11.12.2021.
//

import FirebaseDatabase
import Foundation

protocol FBDatabaseServiceProtocol: AnyObject {
    func getData(_ key: FBDatabasePath, completion: @escaping (Result<Any, ErrorModel>) -> Void)
    func saveNewUser(_ newUser: NewUserModel, completion: @escaping (Result<String, ErrorModel>) -> Void)
}

final class FBDatabaseService {
    
    // MARK: - Properties
    
    private let databaseReference = Database.database(url: FBDatabaseReference.realtime.rawValue).reference()
    
}


// MARK: - FirebaseDatabaseServiceProtocol
extension FBDatabaseService: FBDatabaseServiceProtocol {
    
    func getData(_ key: FBDatabasePath, completion: @escaping (Result<Any, ErrorModel>) -> Void) {
        
        globalQueue {
            self.databaseReference.child(key.stringPath).getData { error, data in
                
                mainQueue {
                    guard let value = data.value, error == nil else {
                        completion(.failure(.somethingWentWrong))
                        return
                    }
                    
                    completion(.success(value))
                }
            }
        }
    }
    
    func saveNewUser(_ newUser: NewUserModel, completion: @escaping (Result<String, ErrorModel>) -> Void) {
        
        globalQueue {
            let path = FBDatabasePath.user(token: newUser.uniqueToken).stringPath
            self.databaseReference.child(path).setValue(newUser.asDictionary) { error, _ in
                
                mainQueue {
                    error != nil
                        ? completion(.failure(.errorToSaveNewUser))
                        : completion(.success(newUser.uniqueToken))
                }
            }
        }
    }
    
}
