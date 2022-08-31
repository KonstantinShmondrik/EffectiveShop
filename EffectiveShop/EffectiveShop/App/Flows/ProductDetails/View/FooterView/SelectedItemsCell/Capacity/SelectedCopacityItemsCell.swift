//
//  SelectedCopacityItemsCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 31.08.2022.
//

import UIKit
import SnapKit

class SelectedCopacityItemsCell: UICollectionViewCell {
    
    static var reuseIdentifier = "SelectedCopacityItemsCell"
    
    
    override var isSelected: Bool {
        didSet {
            copacityNamesLabel.textColor = isSelected ? .white : .gray
            circularView.backgroundColor = isSelected ? AppColor.orange : .white

        }
    }
    
    // MARK: - Outlets
    private let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var circularView: UIView = {
        let view = UIView(frame: frame)
        
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   
    
    private(set) lazy var copacityNamesLabel: UILabel = {
        let label = AppLabel(alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 13, weight: .bold),
                             colorText: UIColor.gray,
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
extension SelectedCopacityItemsCell {
    func configurate(name: String) {
        self.copacityNamesLabel.text = "\(name) GB"
    }
}

// MARK: - Configure UI
private extension SelectedCopacityItemsCell {
    
    func addSubviewsContent() {
        contentView.addSubview(conteinerView)
        conteinerView.addSubviews([circularView, copacityNamesLabel])
        
    }
    
    func configureUI() {
        conteinerView.backgroundColor = .white
       
        circularView.snp.makeConstraints {
            $0.top.bottom.equalTo(conteinerView).offset(0)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
            $0.centerX.equalTo(conteinerView.snp.centerX)
        }
        
        copacityNamesLabel.snp.makeConstraints {
            $0.center.equalTo(circularView.snp.center)
           
        }
        
        conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
        }
    }
}





