//
//  BestSellerItemsCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 28.08.2022.
//

import UIKit
import SnapKit
import SDWebImage

class BestSellerItemsCell: UICollectionViewCell {
    static var reuseIdentifier = "BestSellerItemsCell"
    
    struct ViewData {
        let id: Int?
        let isFavorites: Bool?
        let title: String?
        let priceWithoutDiscount: Int?
        let discountPrice: Int?
        let picture: String?
    }
    
    // MARK: - Outlets
    private let conteinerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var priceWithoutDiscountLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 10, weight: .medium),
                             colorText: UIColor.gray,
                             numberLines: 1)
        
        
        let strikethroughAttribute = [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: " ", attributes: strikethroughAttribute)
        label.attributedText = underlineAttributedString
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var discountPriceLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 16, weight: .bold),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var brendLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 10, weight: .regular),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var favoritButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = AppColor.orange
        button.layer.cornerRadius = 12.5
        button.clipsToBounds = true
        button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        button.addTarget(self, action: #selector(favoritPressed), for: .touchUpInside)
        
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
extension BestSellerItemsCell {
    func configurate(data: BestSellerItemsCell.ViewData) {
        self.brendLabel.text = data.title ?? ""
        self.discountPriceLabel.text = String("$\(data.discountPrice ?? 0)")
        self.priceWithoutDiscountLabel.text = String("$\(data.priceWithoutDiscount ?? 0)")
        
        guard let imageString = data.picture else { return }
        guard let url = URL(string: imageString) else { return }
        self.pictureImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        
        if data.isFavorites == true {
            self.favoritButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            self.favoritButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
}

// MARK: - Actions
extension BestSellerItemsCell {
    
    @objc func favoritPressed() {
        print ("Press button to favorit")
        
    }
}

// MARK: - Configure UI
private extension BestSellerItemsCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([pictureImageView, favoritButton, discountPriceLabel, priceWithoutDiscountLabel, brendLabel])
    }
    
    func configureUI() {
        
        pictureImageView.snp.makeConstraints {
            $0.leading.trailing.equalTo(conteinerView).offset(0)
            $0.height.equalTo(168)
            $0.top.equalTo(conteinerView).offset(5)
        }
        
        favoritButton.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(10)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
            $0.trailing.equalTo(conteinerView).offset(-15)
        }
        
        discountPriceLabel.snp.makeConstraints {
            $0.top.equalTo(pictureImageView.snp.bottom).offset(2)
            $0.leading.equalTo(conteinerView).offset(21)
        }
        
        priceWithoutDiscountLabel.snp.makeConstraints {
            $0.centerY.equalTo(discountPriceLabel.snp.centerY)
            $0.leading.equalTo(discountPriceLabel.snp.trailing).offset(7)
        }
        
        brendLabel.snp.makeConstraints {
            $0.top.equalTo(discountPriceLabel.snp.bottom).offset(5)
            $0.leading.equalTo(conteinerView).offset(21)
        }
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}
