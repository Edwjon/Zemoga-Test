//
//  PosteCell.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 5/5/22.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
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
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, constant: -50).isActive = true
    }
    
}
