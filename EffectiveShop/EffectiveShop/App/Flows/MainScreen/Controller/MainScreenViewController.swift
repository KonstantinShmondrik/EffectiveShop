//
//  MainViewController.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 25.08.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: - Private Properties
    private let requestFactory = RequestFactory()
    private let transition = PanelTransition()
    
    // MARK: - Properties
    
    var mainResult: MainResult = MainResult(homeStore: [], bestSeller: [])
    var selectItems: [SelectItems] = [SelectItems(name: "Phones", image: "phone"),
                                      SelectItems(name: "Computer", image: "computer"),
                                      SelectItems(name: "Heals", image: "health"),
                                      SelectItems(name: "Books", image: "books")]
    // MARK: - Initialisers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let view = MainScreenView()
        view.delegate = self
        self.view = view
        view.selectItems = selectItems
        view.configurate(mainResult: mainResult)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        getMainScreen()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isTranslucent = true
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Privat func
    
    private func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(filterTapped))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.darkBlue
    }
    
    private func getFilterMenu() {
        let child = FilterOptionsViewController()
                child.transitioningDelegate = transition
                child.modalPresentationStyle = .custom

                present(child, animated: true)
        
    }
    
    private func getMainScreen() {
        let main = requestFactory.makeMainRequestFactory()
        main.getMain() { [weak self] response in
            switch response.result {
            case .success(let result):
                print(result)
                self?.mainResult = result
                DispatchQueue.main.async {
                    self?.loadView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Actions
    @objc func filterTapped (sender: UIBarButtonItem) {
        getFilterMenu()
    }
    
}

extension MainScreenViewController: MainScreenViewProtocol {
    func buyHotSalesButtonTapped(_ index: Int) {
        let homeStore = mainResult.homeStore[index]
        
        let item = AppBasketItem(productId: homeStore.id,
                                 productName: homeStore.title,
                                 price: nil,
                                 picUrl: homeStore.picture)
        
        AppBasket.shared.items.append(item)
        tabBarController?.viewDidLoad()
    }
    
    func showProductDitail() {
        navigationController?.pushViewController(ProductDetailsViewController(), animated: true)
    }
    
    
}
