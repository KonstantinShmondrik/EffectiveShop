//
//  SelectedCopacityView.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 31.08.2022.
//

import UIKit
import SnapKit

class SelectedCopacityView: UIView {
    // MARK: - Properties
    var copacityes: [String] = []
    
    // MARK: - Outlets
    
    private let conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layoutIfNeeded()
        collectionView.registerClass(SelectedCopacityItemsCell.self)

        return collectionView
        
    }()
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
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

// MARK: - Configure View
extension SelectedCopacityView {
    
    func configurate(copacityes: [String]) {
        self.copacityes = copacityes
        collectionView.reloadData()
        if collectionView.numberOfItems(inSection: 0) != 0 {
            collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .left)
        }
    }
    
}

// MARK: - Actions
extension SelectedCopacityView {
    
}

// MARK: - UICollectionViewDelegate
extension SelectedCopacityView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension SelectedCopacityView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return copacityes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: SelectedCopacityItemsCell = collectionView.cell(forRowAt: indexPath) else {
            return UICollectionViewCell()
        }
        let copacity = copacityes[indexPath.row]
        cell.configurate(name: copacity)

        cell.layoutIfNeeded()
        return cell
    }
}

// MARK: - DidSelectItemAt
extension SelectedCopacityView {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажата ячейка \(indexPath.item)")
    }
}

// MARK: - UICollectionViewDataSource
extension SelectedCopacityView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 10)/2,
                     height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - Configure UI
private extension SelectedCopacityView {
    
    func addSubviewsContent() {
        addSubview(conteinerView)
        conteinerView.addSubviews([collectionView])
    }
    
    func configureUI() {
        conteinerView.backgroundColor = .white
        conteinerView.snp.makeConstraints {
            $0.top.equalTo(self).offset(0)
            $0.leading.trailing.equalTo(self).offset(0)
            $0.bottom.equalTo(self).offset(0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(0)
            $0.leading.equalTo(conteinerView).offset(0)
            $0.trailing.equalTo(conteinerView).offset(0)
            $0.bottom.equalTo(conteinerView).offset(0)
        }
    }
    
}
