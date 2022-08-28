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
    
   
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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

}

// MARK: - Actions
extension BestSellerCollectionViewCell {
    
    @objc func seeMoreButtonPressed() {
        print ("Press button see more")
        
    }
}

// MARK: - Configure UI
private extension BestSellerCollectionViewCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([hederLabel, seeMoreButton])
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
        
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}
