//
//  User.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import Firebase

public struct User {
    let uid: String
    let email: String
    
    public init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email ?? ""
    }
    
    public init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
