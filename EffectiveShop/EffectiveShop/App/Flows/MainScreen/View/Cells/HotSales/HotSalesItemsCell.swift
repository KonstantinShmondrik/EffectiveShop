//
//  HotSalesItemsCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 28.08.2022.
//

import UIKit
import SnapKit
import SDWebImage

class HotSalesItemsCell: UICollectionViewCell {
    static var reuseIdentifier = "HotSalesItemsCell"
    
    struct ViewData {
        let id: Int?
        let isNew: Bool?
        let title: String?
        let subtitle: String?
        let picture: String?
        let isBuy: Bool?
    }
    
    
    // MARK: - Outlets
    private let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = AppColor.darkBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var circularView: UIView = {
        let view = UIView(frame: frame)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = AppColor.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var isNewLabel: UILabel = {
        let label = AppLabel(title: "New",
                             alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 10, weight: .bold),
                             colorText: UIColor.white,
                             numberLines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var brendLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 25, weight: .bold),
                             colorText: UIColor.white,
                             numberLines: 1)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 11, weight: .regular),
                             colorText: UIColor.white,
                             numberLines: 1)
      
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Buy Now!", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font = AppFont.markProFont(ofSize: 11, weight: .bold)
        button.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
       
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
extension HotSalesItemsCell {
    func configurate(data: HotSalesItemsCell.ViewData) {
        self.brendLabel.text = data.title
        self.descriptionLabel.text = data.subtitle
        
        guard let imageString = data.picture else { return }
        guard let url = URL(string: imageString) else { return }
        self.pictureImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        
        if data.isNew == true {
            self.circularView.isHidden = false
        } else {
            self.circularView.isHidden = true
        }
        
    }
}

// MARK: - Actions
extension HotSalesItemsCell {
    
    @objc func buyButtonPressed() {
        print ("Press button Buy now")
        
    }
}

// MARK: - Configure UI
private extension HotSalesItemsCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([pictureImageView, buyButton])
        pictureImageView.addSubviews([circularView, brendLabel, descriptionLabel])
        circularView.addSubview(isNewLabel)
    }
    
    func configureUI() {
        conteinerView.backgroundColor = AppColor.backgraund
        
        
        pictureImageView.snp.makeConstraints {
            $0.leading.trailing.equalTo(conteinerView).offset(0)
            $0.height.equalTo(184)
            $0.top.bottom.equalTo(conteinerView).offset(0)
        }
        
        circularView.snp.makeConstraints {
            $0.top.equalTo(pictureImageView.snp.top).offset(20)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
            $0.leading.equalTo(conteinerView).offset(32)
        }
        
        isNewLabel.snp.makeConstraints {
            $0.center.equalTo(circularView.snp.center)
        }
        
        brendLabel.snp.makeConstraints {
            $0.top.equalTo(circularView.snp.bottom).offset(18)
            $0.leading.equalTo(conteinerView).offset(32)
        }
        
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(brendLabel.snp.bottom).offset(5)
            $0.leading.equalTo(conteinerView).offset(32)
        }
        
        buyButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(26)
            $0.leading.equalTo(conteinerView).offset(32)
            $0.width.equalTo(98)
            $0.height.equalTo(23)
        }
        
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}
