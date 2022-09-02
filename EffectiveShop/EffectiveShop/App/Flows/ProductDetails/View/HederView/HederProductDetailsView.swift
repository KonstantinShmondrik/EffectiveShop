//
//  HederProductDetailsView.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 30.08.2022.
//

import UIKit
import SnapKit

class HederProductDetailsView: UIView {
    
    // MARK: - Properties
    var pictures: [String] = []
    
    // MARK: - Outlets
    
    private let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = AppColor.backgraund
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layoutIfNeeded()
        collectionView.registerClass(HederProductDetailsCell.self)
        
        return collectionView
        
    }()
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        addSubviewsContent()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure View
extension HederProductDetailsView {
    
    func configurate(pictures: [String]) {
        self.pictures = pictures
        self.collectionView.reloadData()
    }
    
}

// MARK: - Actions
extension HederProductDetailsView {
    
}

// MARK: - UICollectionViewDelegate
extension HederProductDetailsView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension HederProductDetailsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: HederProductDetailsCell = collectionView.cell(forRowAt: indexPath) else {
            return UICollectionViewCell()
        }
        let pictur = pictures[indexPath.row]
        cell.configurate(image: pictur )
       
        cell.layoutIfNeeded()
        return cell
    }
}

// MARK: - DidSelectItemAt
extension HederProductDetailsView {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажата ячейка \(indexPath.item)")
    }
}

// MARK: - UICollectionViewDataSource
extension HederProductDetailsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 40-20)/1.5,
                     height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: (collectionView.frame.width - 40-20)/3, bottom: 0, right: (collectionView.frame.width - 40-20)/3)
    }
}

// MARK: - Configure UI
private extension HederProductDetailsView {
    
    func addSubviewsContent() {
        addSubview(conteinerView)
        conteinerView.addSubviews([collectionView])
    }
    
    func configureUI() {
        conteinerView.backgroundColor = AppColor.backgraund
        conteinerView.snp.makeConstraints {
            $0.top.equalTo(self).offset(0)
            $0.leading.trailing.equalTo(self).offset(0)
//            $0.height.equalTo(350)
            $0.bottom.equalTo(self).offset(0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(4)
            $0.leading.equalTo(conteinerView).offset(0)
            $0.trailing.equalTo(conteinerView).offset(0)
//            $0.height.equalTo(340)
            $0.bottom.equalTo(conteinerView).offset(-4)
            
        }
    }
}
