//
//  FooterBasketTableViewCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 01.09.2022.
//

import UIKit

protocol FooterBasketTableViewCellProtocol: AnyObject {
    func pressPayButton()
}

class FooterCartTableViewCell: UITableViewHeaderFooterView {
    static let reuseIdentifier = "reuseId"
    var delegate: FooterBasketTableViewCellProtocol?
    
    // MARK: - Outlet
    
    private(set) lazy var totalLabel: UILabel = {
        let label = AppLabel(title: "Total",
                             alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 15, weight: .regular),
                             colorText: UIColor.white,
                             numberLines: 1)
        
        return label
    }()
    
    private(set) lazy var deliveryLabel: UILabel = {
        let label = AppLabel(title: "Delivery",
                             alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 15, weight: .regular),
                             colorText: UIColor.white,
                             numberLines: 1)
        
        return label
    }()
    
    private(set) lazy var totalPriceLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 15, weight: .bold),
                             colorText: UIColor.white,
                             numberLines: 1)
        
        return label
    }()
    
    private(set) lazy var deliveryPriceLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 15, weight: .bold),
                             colorText: UIColor.white,
                             numberLines: 1)
        
        return label
    }()
    
    
    private(set) lazy var payButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.orange
        button.tintColor = .white
        button.setTitle("Checkout", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(payBasketButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
       
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = AppColor.darkBlue
        
        [self.totalLabel,
         self.deliveryLabel,
         self.totalPriceLabel,
         self.deliveryPriceLabel,
         self.payButton
        ].forEach() {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            self.totalLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.totalLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 55),
            
            self.deliveryLabel.topAnchor.constraint(equalTo: self.totalLabel.bottomAnchor, constant: 15),
            self.deliveryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 55),
            
            self.totalPriceLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.totalPriceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -35),
            
            self.deliveryPriceLabel.topAnchor.constraint(equalTo: self.totalPriceLabel.bottomAnchor, constant: 15),
            self.deliveryPriceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -35),
            
            self.payButton.topAnchor.constraint(equalTo: self.deliveryLabel.bottomAnchor, constant: 53),
            self.payButton.heightAnchor.constraint(equalToConstant: 55.0),
            self.payButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 44),
            self.payButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -44),
            self.payButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        ])
    }
    
    // MARK: - configure
    
    func configure(count: Int, delivery: String, cart: [Basket] ) {
        if count == 0 {
            self.isHidden = true
        } else {
            self.isHidden = false
            totalPriceLabel.text = "\(cart.map{ $0.price! * ($0.count ?? 1) }.reduce(0, +).formattedString)"
            deliveryPriceLabel.text = delivery
        }
    }
    
    // MARK: - Actions
    
    @objc private func payBasketButtonPressed() {
        delegate?.pressPayButton()
    }
    
    
    
}
