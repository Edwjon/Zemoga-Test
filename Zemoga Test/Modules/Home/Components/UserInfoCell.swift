//
//  UserInfoCell.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 5/5/22.
//

import UIKit

class UserInfoCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "User"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadView() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(websiteLabel)
        websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 12).isActive = true
        websiteLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        websiteLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        websiteLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}


