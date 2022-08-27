//
//  SelectedCategoryItemsCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 27.08.2022.
//

import UIKit
import SnapKit

class SelectedCategoryItemsCell: UICollectionViewCell {
    static var reuseIdentifier = "SelectedCategoryItemsCell"
    
    
    override var isSelected: Bool {
        didSet {
            categoryNamesLabel.textColor = isSelected ? AppColor.orange : .black
            cerculeView.backgroundColor = isSelected ? AppColor.orange : .white
            
            if isSelected {
                categoryImageView.setImageColor(color: .white)
            } else {
                categoryImageView.setImageColor(color: .gray)
            }
        }
    }
    
    // MARK: - Outlets
    private let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var cerculeView: UIView = {
        let view = UIView(frame: frame)
        
        view.layer.cornerRadius = 35
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.setImageColor(color: .gray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var categoryNamesLabel: UILabel = {
        let label = AppLabel(alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 12, weight: .medium),
                             numberLines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
extension SelectedCategoryItemsCell {
    func configurate(name: String, image: String) {
        self.categoryImageView.image = UIImage(named: image)
        self.categoryNamesLabel.text = name
    }
}

// MARK: - Configure UI
private extension SelectedCategoryItemsCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([cerculeView, categoryNamesLabel])
        cerculeView.addSubview(categoryImageView)
    }
    
    func configureUI() {
        conteinerView.backgroundColor = AppColor.backgraund
        conteinerView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
            $0.height.equalTo(130)
        }
        
        cerculeView.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(70)
            $0.centerX.equalTo(conteinerView.snp.centerX)
        }
        
        categoryImageView.snp.makeConstraints {
            $0.center.equalTo(cerculeView.snp.center)
            $0.height.equalTo(30)
        }
        
        
        categoryNamesLabel.snp.makeConstraints {
            $0.top.equalTo(cerculeView.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(conteinerView)
        }
        
        
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}




