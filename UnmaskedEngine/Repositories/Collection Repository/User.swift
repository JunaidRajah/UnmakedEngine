//
//  User.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

public struct User {
    public let uid: String
    public let email: String
    
    public init(authData: FirebaseAuth.User) {
        uid = authData.uid
        email = authData.email ?? ""
    }
    
    public init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
