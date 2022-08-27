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
    
    // MARK: - Properties
    var selectItems: [SelectItems] = []
    
    
    // MARK: - Outlets
    
    private let customView: UIView = {
        let customView = UIView()
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
    
    private(set) lazy var hederLabel: UILabel = {
        let label = AppLabel(title: "Select Category",
                             alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 25, weight: .bold),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.backgraund
        button.setTitle("view all", for: .normal)
        button.tintColor = AppColor.orange
        button.titleLabel?.font = AppFont.markProFont(ofSize: 15, weight: .regular)
        button.addTarget(self, action: #selector(viewAllButtonPressed), for: .touchUpInside)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = AppColor.backgraund
        
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layoutIfNeeded()
        collectionView.registerClass(SelectedCategoryItemsCell.self)
        
        return collectionView
        
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
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
    func configurate(selectItems: [SelectItems]) {
        self.selectItems = selectItems
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
    }
}
// MARK: - Actions
extension SelectedCategoryCollectionViewCell {
    
    @objc func viewAllButtonPressed() {
        print ("Press button view all")
        
    }
}

// MARK: - UICollectionViewDelegate
extension SelectedCategoryCollectionViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension SelectedCategoryCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: SelectedCategoryItemsCell = collectionView.cell(forRowAt: indexPath) else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = AppColor.orange
        
        let selectItem = selectItems[indexPath.item]
        cell.configurate(name: selectItem.name, image: selectItem.image)
        
        cell.layoutIfNeeded()
        return cell
    }
}

// MARK: - DidSelectItemAt
extension SelectedCategoryCollectionViewCell {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажата ячейка \(indexPath.item)")
    }
}

// MARK: - UICollectionViewDataSource
extension SelectedCategoryCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 54 - 20) / 4,
                     height: 131)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
    }
}


// MARK: - Configure UI
private extension SelectedCategoryCollectionViewCell {
    
    func addSubviewsContent() {
        contentView.addSubview(customView)
        customView.addSubviews([hederLabel, viewAllButton, collectionView])
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
        }
        
        viewAllButton.snp.makeConstraints {
            $0.trailing.equalTo(customView).offset(-30)
            $0.centerY.equalTo(hederLabel.snp.centerY)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(hederLabel.snp.bottom).offset(4)
            $0.leading.equalTo(customView).offset(0)
            $0.trailing.equalTo(customView).offset(0)
            $0.height.equalTo(130)
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










