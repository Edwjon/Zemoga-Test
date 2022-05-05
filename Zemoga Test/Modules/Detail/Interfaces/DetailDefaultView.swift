//
//  DetailDefaultView.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

private let detailsCellID = "detailsCellID"
private let userInfoCellID = "userInfoCellID"
private let commentsCellID = "commentsCellID"

class DetailDefaultView: UIViewController {
    
    var presenter: DetailPresenter?
    
    var users: [User]?
    var posts: [Post]?
    var comments: [Comment]?
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Details"
        
        setupLayout()
        setContrainsts()
        setupCollectionView()
        addRightBarbutton()
        
        presenter?.getUser()
        presenter?.getComents()
    }
}


//MARK: - Setup View -
extension DetailDefaultView {
    
    func setupLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DescriptionCell.self, forCellWithReuseIdentifier: detailsCellID)
        collectionView.register(UserInfoCell.self, forCellWithReuseIdentifier: userInfoCellID)
        collectionView.register(CommentsCell.self, forCellWithReuseIdentifier: commentsCellID)
        view.backgroundColor = .systemBlue
        collectionView.backgroundColor = .systemBlue
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setContrainsts() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}


//MARK: - Navigation BarButton and Action -
extension DetailDefaultView {
    
    func addRightBarbutton() {
        
        let imgFill = UIImage(named: "favoriteFill")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let imgNotFill = UIImage(named: "favoriteNotFill")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let defaults = UserDefaults.standard
        let savedArray = defaults.object(forKey: "favoritePosts") as? [String] ?? [String]()
        
        if !savedArray.isEmpty {
            var isFavorite = false
            for i in savedArray {
                if i == "\(String(describing: presenter?.getPostId()))" {
                    isFavorite = true
                }
            }
            
            if !isFavorite {
                let rightBarButtonItem = UIBarButtonItem(image: imgNotFill, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addFavorite))
                self.navigationItem.rightBarButtonItem = rightBarButtonItem
            } else {
                let rightBarButtonItem = UIBarButtonItem(image: imgFill, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addFavorite))
                self.navigationItem.rightBarButtonItem = rightBarButtonItem
            }
            
        } else {
            
            let rightBarButtonItem = UIBarButtonItem(image: imgNotFill, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addFavorite))
            self.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
    
    @objc func addFavorite() {
        
        let defaults = UserDefaults.standard
        let savedArray = defaults.object(forKey: "favoritePosts") as? [String] ?? [String]()
        
        if !savedArray.isEmpty {
            var isFavorite = false
            for (index,i) in savedArray.enumerated() {
                if i == "\(String(describing: presenter?.getPostId()))" {
                    isFavorite = true
                    
                    //Remove From Favorites
                    var array = savedArray
                    array.remove(at: index)
                    defaults.set(array, forKey: "favoritePosts")
                    self.navigationItem.rightBarButtonItem?.image = UIImage(named: "favoriteNotFill")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
            }
            
            if !isFavorite {
                //Add tp favorites
                var array = savedArray
                array.append("\(String(describing: presenter?.getPostId()))")
                defaults.set(array, forKey: "favoritePosts")
                self.navigationItem.rightBarButtonItem?.image = UIImage(named: "favoriteFill")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            }
            
        } else {
            var array = [String]()
            let id = presenter?.getPostId()
            array.append("\(String(describing: id))")
            defaults.set(array, forKey: "favoritePosts")
            self.navigationItem.rightBarButtonItem?.image = UIImage(named: "favoriteFill")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        }
    }
}


//MARK: - CollectionView DataSource -
extension DetailDefaultView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailsCellID, for: indexPath) as! DescriptionCell
            cell.backgroundColor = .clear
            cell.descriptionLabel.text = presenter?.getPostDescription()
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userInfoCellID, for: indexPath) as! UserInfoCell
            cell.backgroundColor = .clear
            let user = users?[0]
            cell.nameLabel.text = user?.name
            cell.emailLabel.text = user?.email
            cell.phoneLabel.text = user?.phone
            cell.websiteLabel.text = user?.website
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commentsCellID, for: indexPath) as! CommentsCell
            cell.comments = comments
            cell.collectionView.reloadData()
            cell.backgroundColor = .clear
            return cell
        }
        
        return UICollectionViewCell()
    }
}


//MARK: - CollectionView FlowLayout -
extension DetailDefaultView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            let description = presenter?.getPostDescription() ?? "No Description"
            
            let aproximateWidthOfBioTextView = view.frame.width - 24
            let size = CGSize(width: aproximateWidthOfBioTextView, height: 1000)
            let attributes = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]

            let estimatedFrame = NSString(string: description).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

            return CGSize(width: view.frame.width, height: estimatedFrame.height + 30)
        }
        
        if indexPath.item == 1 {
            return CGSize(width: view.frame.width, height: 172)
        }
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 300)
        }
        
        return CGSize(width: 0, height: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}


//MARK: - DetailView - 
extension DetailDefaultView: DetailView {
    func reloadData() {
        collectionView.reloadData()
    }
}
