//
//  MainScreenViewModel.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 17.09.2022.
//

import UIKit

final class MainScreenViewModel {
    
    var mainResult: MainResult = MainResult(homeStore: [], bestSeller: [])
    
    let selectItems: [SelectItems] = [SelectItems(name: "Phones", image: "phone"),
                                      SelectItems(name: "Computer", image: "computer"),
                                      SelectItems(name: "Heals", image: "health"),
                                      SelectItems(name: "Books", image: "books")]
    
    private let requestFactory = RequestFactory()

    func getMainScreen(viewController: UIViewController) {
        let main = requestFactory.makeMainRequestFactory()
        main.getMain() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.mainResult = result
                DispatchQueue.main.async {
                    viewController.loadView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
