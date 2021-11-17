//
//  MenuViewModelDelegate.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public protocol MenuViewModelDelegate: AnyObject {
    func signOut()
    func showSignOutFailed(error: Error)
}
