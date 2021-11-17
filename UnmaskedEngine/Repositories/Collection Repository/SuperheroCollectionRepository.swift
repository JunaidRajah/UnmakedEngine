//
//  SuperheroCollectionRepository.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

public class SuperheroCollectionRepository: UserRepositoryFetchable {
    
    private var ref = Database.database().reference()
    private var handle: AuthStateDidChangeListenerHandle?
    private var refObservers: [DatabaseHandle] = []
    
    public init() {}
    
    public func addHero(with name: String, heroToSave: [String : String]) {
        handle = FirebaseAuth.Auth.auth().addStateDidChangeListener { _, currentUser in
            guard currentUser != nil else { return }
            self.ref.child(currentUser!.uid).child("heroes").child(name).setValue(heroToSave)
        }
    }
    
    public func signOut(completion: @escaping databaseResult) {
        guard Auth.auth().currentUser != nil else { return }
        do {
            try Auth.auth().signOut()
            completion(.success(true))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    public func fetchUser(completion: @escaping userResult) {
        handle = FirebaseAuth.Auth.auth().addStateDidChangeListener { _, user in
            if let safeUser = user {
                completion(.success(safeUser))
            } else {
                let userError = CustomError.userNotFound
                completion(.failure(userError))
            }
        }
    }
    
    public func removeUserListener() {
        guard let handle = handle else { return }
        FirebaseAuth.Auth.auth().removeStateDidChangeListener(handle)
    }
    
    public func signInUser(withEmail email: String, password: String, completion: @escaping userResult) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let loginError = error, user == nil {
                completion(.failure(loginError))
            }
        }
    }
    
    public func createUser(withEmail email: String, password: String, completion: @escaping userResult) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let signUpError = error {
                completion(.failure(signUpError))
            } else {
                FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password)
            }
        }
    }
    
    public func fetchUserHeroCollection(completion: @escaping userCollectionResult) {
        handle = Auth.auth().addStateDidChangeListener { _, currentUser in
            guard currentUser != nil else {
                let userError = CustomError.userNotFound
                completion(.failure(userError))
                return
            }
            let completed = self.ref.child(currentUser!.uid).child("heroes").observe(.value) { snapshot in
                var newItems: [superheroCollectionModel] = []
                for child in snapshot.children {
                    if
                        let snapshot = child as? DataSnapshot,
                        let hero = superheroCollectionModel(snapshot: snapshot) {
                        newItems.append(hero)
                    }
                }
                completion(.success(newItems))
            }
            self.refObservers.append(completed)
        }
    }
}
