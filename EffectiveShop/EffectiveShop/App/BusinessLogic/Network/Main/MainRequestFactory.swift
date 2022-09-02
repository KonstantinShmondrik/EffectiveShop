//
//  MainRequestFactory.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import Foundation
import Alamofire

protocol MainRequestFactory {
    func getMain(completionHandler: @escaping (AFDataResponse<MainResult>) -> Void)
}
