//
//  BascetTableViewCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 01.09.2022.
//

import UIKit


protocol CartTableViewCellProtocol: AnyObject {
    func deleteItem(_ index: Int)
    func onChange(index: Int, count: Int)
}

class CartTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "reuseId"
    var delegate: CartTableViewCellProtocol?
    var row: Int?
    var count: Int?
    var onTappedBuyButton: ((String) -> Void)?
    
    // MARK: - Outlet
    private(set) lazy var productNameLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 20, weight: .medium),
                             colorText: UIColor.white,
                             numberLines: 0)
        
        return label
    }()
    
    private(set) lazy var unitPriceLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 20, weight: .regular),
                             colorText: AppColor.orange,
                             numberLines: 1)
        
        return label
    }()
    
    private(set) lazy var totalPriceLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 20, weight: .medium),
                             colorText: AppColor.orange,
                             numberLines: 1)
        
        return label
    }()
    
    private(set) lazy var picImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private(set) lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash", withConfiguration: .none), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buyButton: CartQuantityButton = {
        let button = CartQuantityButton()
        button.layer.cornerRadius = 13
        button.clipsToBounds = true
        button.plusButton.addTarget(self, action: #selector(handleBuyButtonTapped), for: .touchUpInside)
        button.minusButton.addTarget(self, action: #selector(handleBuyButtonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleBuyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func configureUI() {
        self.backgroundColor = .white
        
        [self.productNameLabel,
         self.picImage,
         self.unitPriceLabel,
         self.totalPriceLabel,
         self.deleteButton,
         self.buyButton
        ].forEach() {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        buyButton.onChange = { [weak self] count in
            self?.onTappedBuyButton?(count)
            self?.count = Int(count)
            print(count)
        }
        
        NSLayoutConstraint.activate([
            self.productNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.productNameLabel.leadingAnchor.constraint(equalTo: self.picImage.trailingAnchor, constant: 20),
            self.productNameLabel.widthAnchor.constraint(equalToConstant: 200.0),
            
            self.picImage.topAnchor.constraint(equalTo: self.productNameLabel.topAnchor),
            self.picImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
            self.picImage.widthAnchor.constraint(equalToConstant: 80.0),
            self.picImage.heightAnchor.constraint(equalToConstant: 80.0),
            
            self.deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.deleteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.deleteButton.widthAnchor.constraint(equalToConstant: 16.0),
            self.deleteButton.heightAnchor.constraint(equalToConstant: 16.0),
            
            self.buyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.buyButton.trailingAnchor.constraint(equalTo: self.deleteButton.leadingAnchor, constant: -17),
            self.buyButton.widthAnchor.constraint(equalToConstant: 26),
            self.buyButton.heightAnchor.constraint(equalToConstant: 68),
            
            self.unitPriceLabel.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 6),
            self.unitPriceLabel.leftAnchor.constraint(equalTo: self.productNameLabel.leftAnchor),
            self.unitPriceLabel.rightAnchor.constraint(equalTo: self.productNameLabel.rightAnchor),
            
            self.totalPriceLabel.topAnchor.constraint(equalTo: self.unitPriceLabel.bottomAnchor, constant: 6),
            self.totalPriceLabel.leftAnchor.constraint(equalTo: self.productNameLabel.leftAnchor),
            self.totalPriceLabel.rightAnchor.constraint(equalTo: self.productNameLabel.rightAnchor),
            self.totalPriceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20.0)
        ])
    }
    
    // MARK: - configure
    
    func configure(image: String?, unitPrice: Int?, title: String?, count: Int?) {
        productNameLabel.text = title
        
        if unitPrice != nil {
            unitPriceLabel.text = "Unit: \((unitPrice ?? 0).formattedString)"
        } else {
            unitPriceLabel.text = "Not available"
        }
        
        if unitPrice != nil {
            totalPriceLabel.text = "Total: \(((unitPrice ?? 0) * (count ?? 1)).formattedString)"
        } else {
            totalPriceLabel.text = "Not available"
        }
        
        if let picUrl = image, let itemUrl = URL(string: picUrl) {
            picImage.sd_setImage(with: itemUrl)
        } else {
            picImage.image = UIImage(named: "noPhoto")
        }
        
    }
    
    // MARK: - Actions
    
    @objc private func deleteButtonPressed() {
        delegate?.deleteItem(row ?? 0)
    }
    
    @objc private func handleBuyButtonTapped() {
        delegate?.onChange(index: row ?? 0, count: count ?? 1)
    }
}
