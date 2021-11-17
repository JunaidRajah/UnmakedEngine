//
//  GameViewModelDelegate.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public protocol GameViewModelDelegate: AnyObject {
    func refreshViewContents()
    func showUnlockHeroAlert(with name: String, with publisher: String)
    func showErrorMessage(error: Error)
}
