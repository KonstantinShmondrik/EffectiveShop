//
//  MainScreenView.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 27.08.2022.
//

import UIKit
import SnapKit

enum MainScreenItems: String {
    
    case selectCategoryCell
    case hoteSalesCell
    case bestSellerCell
}
protocol MainScreenViewProtocol {
    func showProductDitail()
    func buyHotSalesButtonTapped(_ index: Int)
    
}

class MainScreenView: UIView {
    
    // MARK: - Outlets
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = (UIScreen.main.bounds.size.width)
        let height = (UIScreen.main.bounds.size.height)
        
        layout.estimatedItemSize = CGSize(width: width, height: 700)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.registerClass(SelectedCategoryCollectionViewCell.self)
        collectionView.registerClass(HotSalesCollectionViewCell.self)
        collectionView.registerClass(BestSellerCollectionViewCell.self)
        
        
        return collectionView
    }()
    
    // MARK: - Properties
    var delegate: MainScreenViewProtocol?
    
    var mainScreenItems: [MainScreenItems] = [.selectCategoryCell,
                                              .hoteSalesCell,
                                              .bestSellerCell]
    var selectItems: [SelectItems] = []
    
    var mainResult: MainResult = MainResult(homeStore: [], bestSeller: [])
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        
        addSubviews([collectionView])
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self).offset(0)
            $0.leading.trailing.equalTo(self).offset(0)
            $0.bottom.equalTo(self).offset(0)
        }
    }
    
}

// MARK: - Configure Cell
extension MainScreenView {
    func configurate(mainResult: MainResult) {
        self.mainResult = mainResult
    }
}

// MARK: UICollectionViewDelegate

extension MainScreenView: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDataSource

extension MainScreenView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return mainScreenItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch mainScreenItems[indexPath.item] {
        case .selectCategoryCell:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? SelectedCategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configurate(selectItems: selectItems)
            
            cell.layoutIfNeeded()
            
            return cell
            
        case .hoteSalesCell:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCollectionViewCell.reuseIdentifier, for: indexPath) as? HotSalesCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configurate(homeStore: mainResult.homeStore)
            cell.delegate = self
            cell.layoutIfNeeded()
            
            return cell
            
        case .bestSellerCell:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.reuseIdentifier, for: indexPath) as? BestSellerCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configurate(bestSeller: mainResult.bestSeller)
            cell.delegate = self
            
            cell.layoutIfNeeded()
            
            return cell
            
        }
    }
}

extension MainScreenView: UICollectionViewDelegateFlowLayout {
    
    
}

extension MainScreenView: BestSellerCollectionViewCellProtocol {
    func showProductDitail() {
        delegate?.showProductDitail()
    }
}

extension MainScreenView: HotSalesCollectionViewCellProtocol {
    func buyButtonTapped(_ index: Int) {
        delegate?.buyHotSalesButtonTapped(index)
    }
    
    
}
