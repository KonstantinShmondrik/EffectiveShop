//
//  FilterOptionsView.swift
//  EffectiveShop
//
//  Created by Константин Шмондрик on 29.08.2022.
//

import UIKit
import SnapKit

protocol FilterOptionsProtocol: AnyObject {
    
    func tapDoneTapped()
    func tapCloseTapped()
    
}


class FilterOptionsView: UIView {
    
    // MARK: - Outlets
    private(set) var hederLabel: UILabel = {
        let label = AppLabel(title:"Filter options",
                             alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 18, weight: .medium),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var brendLabel: UILabel = {
        let label = AppLabel(title:"Brend",
                             alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 18, weight: .medium),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var priceLabel: UILabel = {
        let label = AppLabel(title:"Price",
                             alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 18, weight: .medium),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var sizeLabel: UILabel = {
        let label = AppLabel(title:"Size",
                             alignment: .center,
                             fontSize: AppFont.markProFont(ofSize: 18, weight: .medium),
                             numberLines: 1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.darkBlue
        button.setImage(UIImage(systemName: "xmark", withConfiguration: .none), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        return button
    }()
    
    private(set) var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.orange
        button.setTitle("Done", for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(doneTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    private(set) var brendSelectButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("-", for: .normal)
        button.tintColor = .black
        button.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font = AppFont.markProFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(brendSelectTapped), for: .touchUpInside)
        
        return button
    }()
    
    private(set) var priseSelectButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("-", for: .normal)
        button.tintColor = .black
        button.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font = AppFont.markProFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(priseSelectTapped), for: .touchUpInside)
        
        return button
    }()
    
    private(set) var sizeSelectButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("-", for: .normal)
        button.tintColor = .black
        button.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font = AppFont.markProFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(sizeSelectTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: FilterOptionsProtocol?
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource = [String]()
    
    var brandList = ["Samsung", "Apple", "Xiaomi", "Motorola"]
    var priseList = ["$0 - $10000"]
    var sizeList = ["4.5 to 5.5 inches"]
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuItemsTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.configureUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Privat func
    
    private func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.frame
        self.addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
        
    }
    
    // MARK: - Func
   
    
    
    // MARK: - Actions
    @objc func brendSelectTapped() {
        dataSource = brandList
        selectedButton = brendSelectButton
        addTransparentView(frames: brendSelectButton.frame)
        
    }
    
    @objc func priseSelectTapped() {
        dataSource = priseList
        selectedButton = priseSelectButton
        addTransparentView(frames: priseSelectButton.frame)
        
    }
    
    @objc func sizeSelectTapped() {
        dataSource = sizeList
        selectedButton = sizeSelectButton
        addTransparentView(frames: sizeSelectButton.frame)
        
    }
    
    @objc func doneTapped() {
        delegate?.tapDoneTapped()
    }
    
    @objc func closeTapped() {
        delegate?.tapCloseTapped()
        
    }
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
    
    
    // MARK: - UI
    private func configureUI() {
        self.backgroundColor = .white
        self.addSubviews([hederLabel, brendLabel, priceLabel, sizeLabel, closeButton, doneButton, brendSelectButton, priseSelectButton, sizeSelectButton])
        
        
        hederLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(31)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(24)
            $0.leading.equalTo(self).offset(44)
            $0.height.width.equalTo(37)
        }
        
        doneButton.snp.makeConstraints {
            $0.top.equalTo(self).offset(24)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.height.equalTo(37)
            $0.width.equalTo(86)
        }
        
        brendLabel.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(40)
            $0.leading.equalTo(self).offset(46)
        }
        
        brendSelectButton.snp.makeConstraints {
            $0.top.equalTo(brendLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
            $0.trailing.equalTo(self.snp.trailing).offset(-30)
            $0.height.equalTo(37)
            
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(brendSelectButton.snp.bottom).offset(15)
            $0.leading.equalTo(self).offset(46)
        }
        
        priseSelectButton.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
            $0.height.equalTo(37)
            $0.trailing.equalTo(self.snp.trailing).offset(-30)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.top.equalTo(priseSelectButton.snp.bottom).offset(15)
            $0.leading.equalTo(self).offset(46)
        }
        
        sizeSelectButton.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
            $0.height.equalTo(37)
            $0.trailing.equalTo(self.snp.trailing).offset(-30)
        }
        
    }
    
    
}

extension FilterOptionsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
}
