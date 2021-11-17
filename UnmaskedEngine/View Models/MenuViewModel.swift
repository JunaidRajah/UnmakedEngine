//
//  MenuViewModel.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import Firebase

public class MenuViewModel {
    
    private weak var delegate: MenuViewModelDelegate?
    private var repository: UserRepositoryFetchable
    
    public init(delegate: MenuViewModelDelegate, collectionRepository: UserRepositoryFetchable) {
        self.delegate = delegate
        self.repository = collectionRepository
    }
    
    public func signOut() {
        repository.signOut(completion: { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.signOut()
            case .failure(let error):
                self?.delegate?.showSignOutFailed(error: error)
            }
        })
    }
}

