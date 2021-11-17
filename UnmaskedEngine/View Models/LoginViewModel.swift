//
//  LoginViewModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import Firebase

public class LoginViewModel {
    
    private weak var delegate: LoginViewModelDelegate?
    private var repository: UserRepositoryFetchable
    
    public init(delegate: LoginViewModelDelegate, collectionRepository: UserRepositoryFetchable) {
        self.delegate = delegate
        self.repository = collectionRepository
    }
    
    public func initialUserCheck() {
        repository.fetchUser(completion: { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.autoSignIn()
            case .failure(_):
                let userError = CustomError.userNotFound
                self?.delegate?.showSignInFailed(error: userError)
            }
        })
    }
    
    public func removeUserStateListener() {
        repository.removeUserListener()
    }
    
    public func login(withEmail email: String, password: String) {
        repository.signInUser(withEmail: email, password: password, completion: { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.autoSignIn()
            case .failure(_):
                let userError = CustomError.userNotFound
                self?.delegate?.showSignInFailed(error: userError)
            }
        })
    }
    
    public func signUp(withEmail email: String, password: String) {
        repository.createUser(withEmail: email, password: password, completion:  { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.autoSignIn()
            case .failure(_):
                let userError = CustomError.signUpFailed
                self?.delegate?.showSignUpFailed(error: userError)
            }
        })
    }
}
