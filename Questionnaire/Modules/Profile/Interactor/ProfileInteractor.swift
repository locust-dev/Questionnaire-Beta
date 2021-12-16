//
//  ProfileInteractor.swift
//  Questionnaire
//
//  Created by Ilya Turin on 16.12.2021.
//

protocol ProfileInteractorInput: Parser {
    func fetchUserData()
    func logOut()
}

final class ProfileInteractor {
    
    // MARK: - Properties
    
    weak var presenter: ProfileInteractorOutput?
    
    private let databaseService: FBDatabaseService
    private let authService: FBAuthService
    

    // MARK: - Init
    
    init(databaseService: FBDatabaseService,
         authService: FBAuthService) {
        
        self.databaseService = databaseService
        self.authService = authService
    }
    
}


// MARK: - ProfileInteractorInput
extension ProfileInteractor: ProfileInteractorInput {
    
    func logOut() {
        authService.logOut()
    }
    
    func fetchUserData() {
        
        guard let userToken = authService.currentUserToken else {
            presenter?.didFailFetchUserData(error: .errorToLoadUserInfo)
            return
        }
        
        databaseService.getData(.user(token: userToken)) { [weak self] result in
            
            switch result {
                
            case .success(let userData):
                guard let profileModel = self?.parseJson(rawData: userData, type: ProfileModel.self)
                else {
                    self?.presenter?.didFailFetchUserData(error: .errorToLoadUserInfo)
                    return
                }
                
                self?.presenter?.didSuccessFetchUserData(profile: profileModel)
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.didFailFetchUserData(error: .serverError)
            }
        }
    }
}
