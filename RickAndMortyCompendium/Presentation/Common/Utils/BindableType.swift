//
//  BindableType.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

public protocol BindableType {
    associatedtype ViewModelType

    var presenter: ViewModelType! { get set }
    func setupUI()
}

extension BindableType where Self: UIViewController {

    /**
     Bind the presenter in the UIViewController.
     */
    public mutating func bind(to presenter: Self.ViewModelType) {
        self.presenter = presenter
        loadViewIfNeeded()
        setupUI()
    }

}
