//
//  MyCartViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

class MyCartViewController: UITableViewController {
    
    
    
    private let requestFactory = RequestFactory()
    
    var cartResult: CartResult = CartResult(basket: [],
                                            delivery: "",
                                            id: "",
                                            total: 0)
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMyCart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.reuseIdentifier)
        tableView.register(FooterCartTableViewCell.self, forHeaderFooterViewReuseIdentifier: FooterCartTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = AppColor.darkBlue
        tableView.rowHeight = UITableView.automaticDimension
        navigationItem.title = "My Cart"
        
    }
    
    
    private func getMyCart() {
        let myCart = requestFactory.makeMyCartRequestFactory()
        myCart.getMyCart() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.cartResult = result
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if cartResult.basket.count == 0 {
            return 1
        } else {
            return cartResult.basket.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if cartResult.basket.count == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Cart is empty"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.reuseIdentifier) as? CartTableViewCell
            let cellItem = cartResult.basket[indexPath.row]
            
            
            cell?.configure(image: cellItem.images,
                            unitPrice: cellItem.price,
                            title: cellItem.title,
                            count: cellItem.count)
            
            cell?.delegate = self
            cell?.row = indexPath.row
            cell?.backgroundColor = AppColor.darkBlue
            
            
            
            return cell ?? UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterCartTableViewCell.reuseIdentifier) as? FooterCartTableViewCell else {return UITableViewCell()}
        
        footer.configure(count: cartResult.basket.count,
                         delivery: cartResult.delivery ?? "",
                         cart: cartResult.basket)
        
        footer.delegate = self
        
        footer.backgroundColor = AppColor.darkBlue
        
        return footer
        
    }
    
}

//MARK: - CartTableViewCellProtocol
extension MyCartViewController: CartTableViewCellProtocol {
    func onChange(index: Int, count: Int) {
        cartResult.basket[index].count = count
        self.tableView.reloadData()
    }
    
    func deleteItem(_ index: Int) {
        guard let itemName = cartResult.basket[index].title else {
            return
        }
        
        let alert = UIAlertController(title: "Cart", message: "Are you sure you want to remove \(itemName) from the cart?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.cartResult.basket.remove(at: index)
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}


extension MyCartViewController: FooterBasketTableViewCellProtocol {
    func pressPayButton() {
        
        let alert = UIAlertController(title: "My Cart", message: "Thanks for your purchase!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: {_ in
            UIView.animate(withDuration: 0.2) {
                self.tabBarController?.selectedIndex = 0
            }
        }))
        self.present(alert, animated: true, completion: {
            self.cartResult.basket = []
            self.tableView.reloadData()
        })
    }
}

