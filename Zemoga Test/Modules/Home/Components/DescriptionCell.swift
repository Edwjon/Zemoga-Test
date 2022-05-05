//
//  DescriptionCell.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 5/5/22.
//

import UIKit

class DescriptionCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .justified
        label.numberOfLines = 0
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
        
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
}
