//
//  LoginViewModelDelegate.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public protocol LoginViewModelDelegate: AnyObject {
    func autoSignIn()
    func userNotFound()
    func showSignInFailed(error: CustomError)
    func showSignUpFailed(error: CustomError)
}
