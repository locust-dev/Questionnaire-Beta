//
//  ProfileDataConverter.swift
//  Questionnaire
//
//  Created by Ilya Turin on 16.12.2021.
//

protocol ProfileDataConverterInput {
    func convert(profileModel: ProfileModel) -> ProfileViewModel
}

final class ProfileDataConverter {
    
}


// MARK: - ProfileDataConverterInput
extension ProfileDataConverter: ProfileDataConverterInput {
    
    func convert(profileModel: ProfileModel) -> ProfileViewModel {
        
        return ProfileViewModel(firstName: profileModel.firstName, lastName: profileModel.lastName)
    }
}
