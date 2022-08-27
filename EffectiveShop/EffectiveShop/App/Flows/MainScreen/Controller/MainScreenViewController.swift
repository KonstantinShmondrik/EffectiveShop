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
    
    var mainResult: MainResult = MainResult(homeStore: [], bestSeller: [])
    
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
//                view.delegate = self
                self.view = view
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        getMainScreen()
       
        
        //        let label = AppLabel(title: "фьрррор", alignment: .center, fontSize: AppFont.markProFont(ofSize: 60, weight: .heavy) )
        //        self.view.addSubview(label)
        //        label.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    // MARK: - Privat func
    
    private func setNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .done, target: self, action: #selector(filterTapped))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.darkBlue
    }
    
    private func getMainScreen() {
        let main = requestFactory.makeMainRequestFactory()
        main.getMain() { [weak self] response in
            DispatchQueue.main.async {
            switch response.result {
            case .success(let result):
                print(result)
                self?.mainResult = result
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    }
    
    
    
    // MARK: - Actions
    @objc func filterTapped (sender: UIBarButtonItem) {
        print("tap filter")
    }
    
}
