//
//  BaseDisposeBag.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

public protocol Disposable {
    func disposed(by bag: BaseDisposeBag)
    func dispose()
}

public class BaseDisposeBag {}

let disposeBagNotificationId = NSNotification.Name(rawValue: "disposeBagNotificationId")
let disposeBagNotificationParameter = "disposeBagNotificationParameter"
