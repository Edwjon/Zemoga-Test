//
//  CommentsCell.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 5/5/22.
//

import UIKit

class CommentsCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Comments"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var comments: [Comment]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CommentDetailCell.self, forCellWithReuseIdentifier: "commentDetailCell")
        collectionView.backgroundColor = .clear
        
        setContrainsts()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setContrainsts() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "commentDetailCell", for: indexPath) as! CommentDetailCell
        cell.backgroundColor = .systemFill
        cell.label.text = comments?[indexPath.item].body
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let body = comments?[indexPath.item].body ?? "No body for the comment"
        let aproximateWidthOfBioTextView = frame.width - 50
        let size = CGSize(width: aproximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        
        let estimatedFrame = NSString(string: body).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: frame.width, height: estimatedFrame.height + 66)
    }
    
}



class CommentDetailCell: UICollectionViewCell {
    
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
