//
//  SelectedColorItemsCell.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 31.08.2022.
//

import UIKit
import SnapKit

class SelectedColorItemsCell: UICollectionViewCell {
    
        static var reuseIdentifier = "SelectedColorItemsCell"
        
        
        override var isSelected: Bool {
            didSet {
                checkMarkImageView.isHidden = isSelected ? false : true
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
            
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private(set) lazy var checkMarkImageView: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "checkMark")
            imageView.layer.masksToBounds = true
            imageView.setImageColor(color: .white)
            imageView.isHidden = true
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
    extension SelectedColorItemsCell {
        func configurate(color: UIColor) {
            self.circularView.backgroundColor = color
           
        }
    }

    // MARK: - Configure UI
    private extension SelectedColorItemsCell {
        
        func addSubviewsContent() {
            contentView.addSubview(conteinerView)
            conteinerView.addSubviews([circularView])
            circularView.addSubview(checkMarkImageView)
        }
        
        func configureUI() {
            conteinerView.backgroundColor = .white
            
            circularView.snp.makeConstraints {
                $0.top.bottom.equalTo(conteinerView).offset(0)
                $0.width.equalTo(40)
                $0.height.equalTo(40)
                $0.centerX.equalTo(conteinerView.snp.centerX)
            }
            
            checkMarkImageView.snp.makeConstraints {
                $0.center.equalTo(circularView.snp.center)
                $0.height.equalTo(13)
            }

            conteinerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
            conteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
            conteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
            
            if let lastSubview = contentView.subviews.last {
                contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 0).isActive = true
            }
        }
    }

    
    

