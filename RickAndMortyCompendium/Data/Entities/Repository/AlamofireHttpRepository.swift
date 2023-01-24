//
//  AlamofireHttpRepository.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import Alamofire

public class AlamofireHttpRepository: HttpRepository {
    
    // MARK: - Properties
    
    private let baseUrl: String
    var alamofireSession: Session!
    
    // MARK: - Singleton
    
    private static var repositoryInstance: AlamofireHttpRepository?
    
    public static func shared(baseUrl: String) -> HttpRepository {
        if let repositoryInstance = AlamofireHttpRepository.repositoryInstance {
            return repositoryInstance
        } else {
            AlamofireHttpRepository.repositoryInstance = AlamofireHttpRepository(baseUrl: baseUrl)
            AlamofireHttpRepository.repositoryInstance?.setSession()
            return AlamofireHttpRepository.repositoryInstance!
        }
    }
    
    public func setSession() {
        alamofireSession = Session(configuration: getConfiguration())
    }
    
    // MARK: - Inicialization
    
    internal init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    private func getConfiguration() -> URLSessionConfiguration {
        URLCache.shared.removeAllCachedResponses()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = NetworkConstants.Configuration.requestTimeout
        configuration.urlCache = nil
        return configuration
    }
    
    // MARK: - AlamofireHttpRepository Methods
    
    public func fetchCharacters(onSuccess: @escaping (CharactersDomainModel) -> Void,
                                onFailure: @escaping (Error) -> Void) {
        
        let url = baseUrl + AlamofireHttpRepositoryConstants.Path.characters
        
        alamofireSession.request(url,
                                 method: .get,
                                 headers: getJsonHeader())
            .validate(statusCode: NetworkConstants.HTTPRanges.success)
            .responseData { response in
                switch response.result {
                case .success:
                    do {
                        if let data = response.data {
                            print("\nPOST: \(url) \n\n" + "RESPONSE:\n\n\(String(describing: data.prettyPrintedJSONString!))\n\n")
                            let charactersDomainModel = try CharactersDataModel(data: data).parseToDomainModel()
                            onSuccess(charactersDomainModel)
                        } else {
                            print("\n ERROR: \(url) \n" + "EMPTY DATA")
                            onFailure(GenericDataError(type: .noContent, description: GenericErrorDescription.emptyData.rawValue))
                        }
                    } catch {
                        print("\n ERROR: \(url) \n" + "PARSE FAILED")
                        onFailure(GenericDataError(type: .parseFailed, description: GenericErrorDescription.parseFailed.rawValue))
                    }
                case let .failure(error):
                    print("\n ERROR: \(url) \n")
                    onFailure(AlamofireHttpRepository.onFailureService(response: response, error: error))
                }
            }
    }
    
    // MARK: - Private functions
    
    internal func getJsonHeader() -> HTTPHeaders {
        var headers: HTTPHeaders = HTTPHeaders()
        
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        
        print("\nHEADERS:\n\(headers)\n")
        return headers
    }
    
    private static func onFailureService(response: AFDataResponse<Data>, error: Error) -> Error {

        if let statusCode = response.response?.statusCode {
            return GenericDataError(type: statusCode.errorType, description: error.localizedDescription)
        } else {
            print(error)
            return GenericDataError(type: .unknown, description: error.localizedDescription)
        }
    }
    
}
