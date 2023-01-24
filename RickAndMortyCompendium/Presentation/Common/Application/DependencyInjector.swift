//
//  DependencyInjector.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation

final class DependencyInjector {

    static let shared = DependencyInjector()
    
    func getAlamofireHttpRepository() -> HttpRepository {
        return AlamofireHttpRepository.shared(baseUrl: AlamofireHttpRepositoryConstants.baseURL)
    }
    
    // MARK: - Interactors
    
    func getFetchCharactersInteractor() -> FetchCharactersInteractor {
        return FetchCharactersInteractor(alamofireHttpRepository: getAlamofireHttpRepository())
    }
    
    // MARK: - Presenters
    
    func getSplashPresenter(view: SplashViewControllerProtocol, router: MainWireframeProtocol) -> SplashPresenterProtocol {
        return SplashPresenter(view: view, router: router)
    }
    
    func getMainScreenPresenter(view: MainScreenViewControllerProtocol, router: MainWireframeProtocol) -> MainScreenPresenterProtocol {
        return MainScreenPresenter(view: view, router: router,
                                   fetchCharactersInteractor: getFetchCharactersInteractor())
    }
    
}
