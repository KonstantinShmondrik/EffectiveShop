//
//  SelectedCategoryCollectionViewCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 27.08.2022.
//

import UIKit
import SnapKit

class SelectedCategoryCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier = "SelectedCategoryCollectionViewCell"
    
    
    
    
    
    // MARK: - Outlets
    private(set) lazy var hederLabel: UILabel = {
        let label = AppLabel(title: "Select Category",
                             alignment: .left,
                                fontSize: AppFont.markProFont(ofSize: 25, weight: .bold),
                                numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    private let customView: UIView = {
        let customView = UIView()
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
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
extension SelectedCategoryCollectionViewCell {

}

// MARK: - Configure UI
private extension SelectedCategoryCollectionViewCell {
    
    func addSubviewsContent() {
        contentView.addSubview(customView)
        customView.addSubviews([hederLabel])
    }
    
    func configureUI() {
        customView.backgroundColor = AppColor.backgraund
        customView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
        }
        
        hederLabel.snp.makeConstraints {
            $0.top.equalTo(customView).offset(0)
            $0.leading.equalTo(customView).offset(17)
            $0.width.equalTo(350)
            $0.trailing.equalTo(customView).offset(-16)
            $0.bottom.equalTo(customView).offset(0)
        }
        
        
        
        customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}


    
    
    
    
    
    

