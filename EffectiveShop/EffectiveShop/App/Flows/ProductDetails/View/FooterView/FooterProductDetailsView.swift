//
//  FooterProductDetailsView.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 30.08.2022.
//

import UIKit
import SnapKit

class FooterProductDetailsView: UIView {
    
    
    struct ViewData {
        let cpu, camera: String?
        let capacity, color: [String]
        let id: String?
        let isFavorites: Bool?
        let price: Int?
        let rating: Double?
        let sd, ssd, title: String?
    }
    
    // MARK: - Properties
    //    var pictures: [String] = [" "]
    
    // MARK: - Outlets
    
    private let conteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) var hederLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 24, weight: .medium),
                             numberLines: 0)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var footerLabel: UILabel = {
        let label = AppLabel(title:"Select color and capacity",
                             alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 16, weight: .medium),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var favoritButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        button.backgroundColor = AppColor.darkBlue
        button.addTarget(self, action: #selector(favoritPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Add to cart", for: .normal)
        button.backgroundColor = AppColor.orange
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        
        button.addTarget(self, action: #selector(addCartButtonPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var CPUImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "CPU")
        //        imageView.setImageColor(color: .gray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var cameraImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "camera")
        //        imageView.setImageColor(color: .gray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var ssdImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "ssd")
        //        imageView.setImageColor(color: .gray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var sdImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "sd")
        //        imageView.setImageColor(color: .gray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) var CPULabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 11, weight: .regular),
                             colorText: UIColor.gray,
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var cameraLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 11, weight: .regular),
                             colorText: UIColor.gray,
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var ssdLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 11, weight: .regular),
                             colorText: UIColor.gray,
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var sdLabel: UILabel = {
        let label = AppLabel(alignment: .left,
                             fontSize: AppFont.markProFont(ofSize: 11, weight: .regular),
                             colorText: UIColor.gray,
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        collectionView.delegate = self
        //        collectionView.dataSource = self
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
extension FooterProductDetailsView {
    
    func configurate(data: FooterProductDetailsView.ViewData) {
        hederLabel.text = data.title ?? ""
        CPULabel.text = data.cpu ?? ""
        cameraLabel.text = data.camera ?? ""
        ssdLabel.text = data.ssd ?? ""
        sdLabel.text = data.sd ?? ""
        addToCartButton.setTitle("Add to cart        $\(String(describing: data.price ?? 0))", for: .normal)
    
        }
    
}

// MARK: - Actions
extension FooterProductDetailsView {
    
    @objc func favoritPressed() {
        print ("Press button to favorit")
        
    }
    @objc func addCartButtonPressed() {
        print ("Press button to favorit")
        
    }
    
}



// MARK: - Configure UI
private extension FooterProductDetailsView {
    
    func addSubviewsContent() {
        addSubview(conteinerView)
        conteinerView.addSubviews([hederLabel, favoritButton, footerLabel, addToCartButton, CPUImageView, cameraImageView, ssdImageView, sdImageView, CPULabel, cameraLabel, ssdLabel, sdLabel])
    }
    
    func configureUI() {
        //        conteinerView.backgroundColor = AppColor.backgraund
        conteinerView.snp.makeConstraints {
            $0.top.equalTo(self).offset(0)
            $0.leading.trailing.equalTo(self).offset(0)
            //            $0.height.equalTo(350)
            $0.bottom.equalTo(self).offset(0)
        }
        hederLabel.text = "Galaxy Note 20 Ultra" // для теста
        hederLabel.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(28)
            $0.leading.equalTo(conteinerView).offset(38)
            $0.trailing.equalTo(favoritButton.snp.leading).offset(-10)
            //            $0.width.equalTo(245)
        }
        
        favoritButton.snp.makeConstraints {
            $0.top.equalTo(conteinerView).offset(28)
            $0.trailing.equalTo(conteinerView).offset(-37)
            $0.height.equalTo(33)
            $0.width.equalTo(37)
        }
        
        CPUImageView.snp.makeConstraints {
            $0.top.equalTo(hederLabel.snp.bottom).offset(100)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
            $0.leading.equalTo(conteinerView.snp.leading).offset(45)
        }
        
        cameraImageView.snp.makeConstraints {
            $0.centerY.equalTo(CPUImageView.snp.centerY)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
            $0.leading.equalTo(CPUImageView.snp.trailing).offset(60)
        }
        
        ssdImageView.snp.makeConstraints {
            $0.centerY.equalTo(cameraImageView.snp.centerY)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
            $0.leading.equalTo(cameraImageView.snp.trailing).offset(60)
        }
        
        sdImageView.snp.makeConstraints {
            $0.centerY.equalTo(ssdImageView.snp.centerY)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
            $0.leading.equalTo(ssdImageView.snp.trailing).offset(60)
        }
        
        CPULabel.snp.makeConstraints {
            $0.centerX.equalTo(CPUImageView.snp.centerX)
            $0.top.equalTo(CPUImageView.snp.bottom).offset(5)
        }
        
        cameraLabel.snp.makeConstraints {
            $0.centerX.equalTo(cameraImageView.snp.centerX)
            $0.top.equalTo(cameraImageView.snp.bottom).offset(5)
        }
        
        ssdLabel.snp.makeConstraints {
            $0.centerX.equalTo(ssdImageView.snp.centerX)
            $0.top.equalTo(ssdImageView.snp.bottom).offset(5)
        }
        
        sdLabel.snp.makeConstraints {
            $0.centerX.equalTo(sdImageView.snp.centerX)
            $0.top.equalTo(sdImageView.snp.bottom).offset(5)
        }
        
        footerLabel.snp.makeConstraints {
            $0.top.equalTo(CPULabel.snp.bottom).offset(29)
            $0.leading.equalTo(conteinerView).offset(30)
            
        }
        
        addToCartButton.snp.makeConstraints {
            $0.top.equalTo(footerLabel.snp.bottom).offset(81)
            $0.trailing.equalTo(conteinerView).offset(-30)
            $0.leading.equalTo(conteinerView).offset(30)
            $0.height.equalTo(55)
            
        }
        
        
    }
}




