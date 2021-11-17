//
//  SuperheroCollectionRepositoryProtocols.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public typealias userResult = (Result<FirebaseAuth.User, Error>) -> Void
public typealias userCollectionResult = (Result<[superheroCollectionModel], Error>) -> Void
public typealias databaseResult = (Result<Bool, Error>) -> Void

public protocol UserRepositoryFetchable {
    func fetchUser(completion: @escaping userResult)
    func signInUser(withEmail email: String, password: String, completion: @escaping userResult)
    func createUser(withEmail email: String, password: String, completion: @escaping userResult)
    func fetchUserHeroCollection(completion: @escaping userCollectionResult)
    func signOut(completion: @escaping databaseResult)
    func addHero(with name: String, heroToSave: [String : String])
    func removeUserListener()
}
