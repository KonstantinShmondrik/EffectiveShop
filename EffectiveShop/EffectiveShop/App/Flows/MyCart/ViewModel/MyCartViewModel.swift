//
//  MyCartViewModel.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 18.09.2022.
//

import UIKit

final class MyCartViewModel {
    
    var cartResult: CartResult = CartResult(basket: [],
                                            delivery: "",
                                            id: "",
                                            total: 0)
    
    private let requestFactory = RequestFactory()
    
     func getMyCart(tableView: UITableViewController) {
        let myCart = requestFactory.makeMyCartRequestFactory()
        myCart.getMyCart() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.cartResult = result
                DispatchQueue.main.async {
                    tableView.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
