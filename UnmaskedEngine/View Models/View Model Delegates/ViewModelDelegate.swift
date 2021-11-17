//
//  ViewModelDelegate.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/17.
//

import Foundation

public protocol ViewModelDelegate: AnyObject {
    func refreshViewContents()
    func showErrorMessage(error: Error)
}

public protocol CollectionViewModelDelegate: AnyObject {
    func refreshViewContents()
    func loadHeroFromCollection()
    func showErrorMessage(error: Error)
}
