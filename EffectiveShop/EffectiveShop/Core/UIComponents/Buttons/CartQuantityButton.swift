//
//  CartQuantityButton.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 01.09.2022.
//

import UIKit
import SnapKit

class CartQuantityButton: UIControl {
    
    private enum ActionState {
        case initial(Int), tap, increase, decrease
    }
    
    private var count: Int = 1
    
    private(set) var quantityLabel: UILabel = {
        let label = AppLabel(title: "1",
                             alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 20, weight: .medium),
                             colorText: UIColor.white,
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Public Properties
    
    let maxCount: Int = 9
    var quantity: String {
        return String(count)
    }
    var onChange: ((String) -> Void)?
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColor.slate
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        addSubviewsContent()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    @objc private func minusButtonTapped() {
        updateCount(action: .decrease)
    }
    
    @objc private func plusButtonTapped() {
        updateCount(action: .increase)
    }
    
    @objc private func buyButtonTapped() {
        updateCount(action: .tap)
    }

    private func updateCount(action: ActionState) {
        quantityLabel.text = quantity
        switch action {
        case .initial(let value):
            if value == 0 {
                count = value
            }
        case .tap:
            count += 1
        case .increase:
            if count >= maxCount { return }
            count += 1
        case .decrease:
            count -= 1
            if count < 1 {
                count = 1
            }
        }
        quantityLabel.text = quantity
        onChange?(quantity)
        
    }
    
}

// MARK: - Configure UI
private extension CartQuantityButton {
    
    func addSubviewsContent() {
        self.addSubviews([quantityLabel, minusButton, plusButton])
        
    }
    
    func configureUI() {
        quantityLabel.snp.makeConstraints {
            $0.center.equalTo(self.snp.center)
            
        }
        
        minusButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(8)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(9)
        }
        
        plusButton.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom).offset(-8)
            $0.centerX.equalTo(self.snp.centerX)
            $0.height.equalTo(9)
            $0.width.equalTo(9)
            
        }
    }
}
