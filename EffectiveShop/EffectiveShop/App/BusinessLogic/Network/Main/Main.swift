//
//  Main.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//


import Foundation
import Alamofire

class Main: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    
    let baseUrl = URL(string: "https://run.mocky.io/")!
    
    init (
        errorParser: AbstractErrorParser,
        sessinManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessinManager
            self.queue = queue
        }
}

extension Main: MainRequestFactory {
    func getMain(completionHandler: @escaping (AFDataResponse<MainResult>) -> Void) {
        let requestModel = GetMain(baseURL: baseUrl)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    
}

extension Main {
    struct GetMain: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .get
        let path: String = "v3/654bd15e-b121-49ba-a588-960956b15175"
        
        var parameters: Parameters? {
            return [:]
        }
    }
}
