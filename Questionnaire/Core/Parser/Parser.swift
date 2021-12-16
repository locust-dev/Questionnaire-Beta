//
//  Parser.swift
//  Questionnaire
//
//  Created by Ilya Turin on 13.12.2021.
//

import Foundation

protocol Parser {
    func parseJson<Model: Decodable>(rawData: Any, type: Model.Type) -> Model?
}


// MARK: - Default implementation
extension Parser {
    
    func parseJson<Model: Decodable>(rawData: Any, type: Model.Type) -> Model? {
        
        if (rawData as? NSNull) != nil {
            return nil
        }
        
        do {
            let json = try JSONSerialization.data(withJSONObject: rawData)
            let decodedData = try JSONDecoder().decode(Model.self, from: json)
            return decodedData

        } catch(let error) {
            // TODO: - Error model
            print(error.localizedDescription)
            return nil
        }
    }
    
}

