//
//  BestSellerCollectionViewCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 27.08.2022.
//

import UIKit
import SnapKit

class BestSellerCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier = "BestSellerCollectionViewCell"
    
    // MARK: - Properties
    var bestSeller: [BestSeller] = []
    
    // MARK: - Outlets
    
    private let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var hederLabel: UILabel = {
        let label = AppLabel(title: "Best Seller",
                             alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 25, weight: .bold),
                             numberLines: 0)
        
        return label
    }()
    
    private(set) lazy var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.backgraund
        button.setTitle("see more", for: .normal)
        button.tintColor = AppColor.orange
        button.titleLabel?.font = AppFont.markProFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(seeMoreButtonPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = AppColor.backgraund
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layoutIfNeeded()
        collectionView.registerClass(BestSellerItemsCell.self)
        
        return collectionView
        
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
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

// MARK: - Configure Cell
extension BestSellerCollectionViewCell {
    func configurate(bestSeller: [BestSeller]) {
        self.bestSeller = bestSeller
        
    }
}

// MARK: - Actions
extension BestSellerCollectionViewCell {
    
    @objc func seeMoreButtonPressed() {
        print ("Press button see more")
        
    }
}

// MARK: - UICollectionViewDelegate
extension BestSellerCollectionViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension BestSellerCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSeller.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: BestSellerItemsCell = collectionView.cell(forRowAt: indexPath) else {
            return UICollectionViewCell()
        }
        let bestSeller = bestSeller[indexPath.item]
        cell.configurate(data: .init(id: bestSeller.id,
                                     isFavorites: bestSeller.isFavorites ?? false,
                                     title: bestSeller.title ?? "",
                                     priceWithoutDiscount: bestSeller.priceWithoutDiscount ?? 0,
                                     discountPrice: bestSeller.discountPrice ?? 0,
                                     picture: bestSeller.picture ?? ""))
        
        cell.layoutIfNeeded()
        return cell
    }
}

// MARK: - DidSelectItemAt
extension BestSellerCollectionViewCell {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажата ячейка \(indexPath.item)")
    }
}

// MARK: - UICollectionViewDataSource
extension BestSellerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 16 - 12)/2,
                     height: 227)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}

// MARK: - Configure UI
private extension BestSellerCollectionViewCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([hederLabel, seeMoreButton, collectionView])
    }
    
    func configureUI() {
        conteinerView.backgroundColor = AppColor.backgraund
        conteinerView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
        }
        
        hederLabel.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(0)
            $0.leading.equalTo(conteinerView).offset(17)
            $0.width.equalTo(350)
            $0.trailing.equalTo(conteinerView).offset(-16)
        }
        
        seeMoreButton.snp.makeConstraints {
            $0.trailing.equalTo(conteinerView).offset(-30)
            $0.centerY.equalTo(hederLabel.snp.centerY)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(hederLabel.snp.bottom).offset(0)
            $0.leading.equalTo(conteinerView).offset(0)
            $0.trailing.equalTo(conteinerView).offset(-8)
            $0.height.equalTo(625)
            $0.bottom.equalTo(conteinerView).offset(0)
            
        }
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}
