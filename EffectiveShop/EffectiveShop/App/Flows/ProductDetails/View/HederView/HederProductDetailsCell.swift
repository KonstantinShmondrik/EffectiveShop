//
//  HederProductDetailsCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 30.08.2022.
//

import UIKit
import SnapKit
import SDWebImage

class HederProductDetailsCell: UICollectionViewCell {
    
    static var reuseIdentifier = "HederProductDetailsCell"
    
    // MARK: - Outlets
    private let conteinerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
extension HederProductDetailsCell {
    func configurate(image: String?) {
        
        guard let imageString = image else { return }
        guard let url = URL(string: imageString) else { return }
        self.pictureImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: ""))
        
    }
}

// MARK: - Actions
extension HederProductDetailsCell {
    
}

// MARK: - Configure UI
private extension HederProductDetailsCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([pictureImageView])
    }
    
    func configureUI() {
        conteinerView.backgroundColor = .white
        
        
        pictureImageView.snp.makeConstraints {
            $0.leading.trailing.equalTo(conteinerView).offset(0)
            //                $0.height.equalTo(320)
            $0.top.bottom.equalTo(conteinerView).offset(0)
        }
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        conteinerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}


