//
//  SplashPresenter.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

protocol SplashPresenterProtocol: BasePresenterProtocol {}

class SplashPresenter: BasePresenter<SplashViewControllerProtocol, MainWireframeProtocol>,
                       SplashPresenterProtocol {
    
    // MARK: - Initializer
    
    init(view: SplashViewControllerProtocol,
         router: MainWireframeProtocol) {
        super.init(view: view, router: router)
    }
    
    // MARK: - LifeCycle
    
    override func didAppear() {
        super.didAppear()
        sleep(1)
        getRouter()?.toMainScreen()
    }
    
}
