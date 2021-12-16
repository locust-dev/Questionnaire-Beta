//
//  ProfileViewModel.swift
//  Questionnaire
//
//  Created by Ilya Turin on 10.12.2021.
//

struct ProfileViewModel {
    
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }

}
