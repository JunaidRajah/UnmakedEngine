//
//  UnmaskedViewModelDelegate.swift
//  UnmaskedEngine
//
//  Created by Junaid Rajah on 2021/11/19.
//

import Foundation

public protocol UnmaskedViewModelDelegate: AnyObject {
    func changeGroup()
    func showErrorMessage(error: Error)
}
