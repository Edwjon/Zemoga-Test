//
//  HomeDefaultView.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

class HomeDefaultView: UIViewController {

    var collectionView: UICollectionView!
    
    var presenter: HomePresenter?
    var posts: [Post]?
    var auxiliarPosts: [Post]?
    
    let bottomButton: UIButton = {
        let bottomButton = UIButton(type: .system)
        bottomButton.backgroundColor = UIColor(red: 11/255, green: 5/255, blue: 85/255, alpha: 1)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.setTitle("Delete Posts", for: .normal)
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.addTarget(self, action: #selector(deletePosts), for: .touchUpInside)
        return bottomButton
    }()
    
    let setAllPostsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("All", for: .normal)
        button.setTitleColor(UIColor(red: 11/255, green: 5/255, blue: 85/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.mask?.clipsToBounds = true
        button.addTarget(self, action: #selector(setAllPosts), for: .touchUpInside)
        return button
    }()
    
    let setFavoritePostsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Favorites", for: .normal)
        button.setTitleColor(UIColor(red: 11/255, green: 5/255, blue: 85/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.mask?.clipsToBounds = true
        button.addTarget(self, action: #selector(setFavoritesPosts), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Posts"
        addRightBarbutton()
        
        setupLayout()
        setContrainsts()
        setupCollectionView()
        
        presenter?.getContents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let savedArray = defaults.object(forKey: "favoritePosts") as? [String] ?? [String]()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !savedArray.isEmpty {
                for (index, element) in self.posts!.enumerated() {
                    for (index2, element2) in savedArray.enumerated() {
                        
                        if element2 == "\(String(describing: element.id))" {
                            //The post is a favorite
                            let auxiliarPost = element
                            self.posts?.remove(at: index)
                            self.posts?.insert(auxiliarPost, at: 0)
                        }
                    }
                }
            }
            self.collectionView.reloadData()
        }
        
    }
}


//MARK: - View Setup -
extension HomeDefaultView {
    
    func setupLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
        view.backgroundColor = .systemBlue
        collectionView.backgroundColor = .systemBlue
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setContrainsts() {
        view.addSubview(bottomButton)
        bottomButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        bottomButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomButton.topAnchor, constant: -10).isActive = true
    }
    
    func addRightBarbutton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPosts))
    }
    
    @objc func refreshPosts() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        
        presenter?.getContents()
    }
    
    @objc func deletePosts() {
        posts = []
        collectionView.reloadData()
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
    
    @objc func setAllPosts() {
        bottomButton.isHidden = false
        posts = auxiliarPosts
        self.collectionView.reloadData()
    }
    
    @objc func setFavoritesPosts() {
        bottomButton.isHidden = true
        
        auxiliarPosts = posts
        let defaults = UserDefaults.standard
        let savedArray = defaults.object(forKey: "favoritePosts") as? [String] ?? [String]()
        
        if !savedArray.isEmpty {
            var auxiliarPosts = [Post]()
            for (index, element) in self.posts!.enumerated() {
                for (index2, element2) in savedArray.enumerated() {
                    
                    if element2 == "\(String(describing: element.id))" {
                        //The post is not a favorite
                        auxiliarPosts.append(element)
                    }
                }
            }
            posts = auxiliarPosts
            self.collectionView.reloadData()
            
        } else {
            posts = []
            self.collectionView.reloadData()
        }
    }
}


//MARK: - CollectionView DataSource -
extension HomeDefaultView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PostCell
        cell.backgroundColor = .systemFill
        cell.label.text = posts?[indexPath.item].title
        
        //Check if favorite
        let defaults = UserDefaults.standard
        let savedArray = defaults.object(forKey: "favoritePosts") as? [String] ?? [String]()
        
        if !savedArray.isEmpty {
            for i in savedArray {
                if i == "\(String(describing: posts?[indexPath.item].id))" {
                    cell.backgroundColor = .systemYellow
                }
            }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let reusableView = self.collectionView!.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath)
        
        reusableView.addSubview(setAllPostsButton)
        reusableView.addSubview(setFavoritePostsButton)
        
        setAllPostsButton.leftAnchor.constraint(equalTo: reusableView.leftAnchor, constant: 20).isActive = true
        setAllPostsButton.centerYAnchor.constraint(equalTo: reusableView.centerYAnchor, constant: 0).isActive = true
        setAllPostsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        setAllPostsButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        setFavoritePostsButton.rightAnchor.constraint(equalTo: reusableView.rightAnchor, constant: -20).isActive = true
        setFavoritePostsButton.centerYAnchor.constraint(equalTo: reusableView.centerYAnchor, constant: 0).isActive = true
        setFavoritePostsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        setFavoritePostsButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        reusableView.backgroundColor = UIColor(red: 11/255, green: 5/255, blue: 85/255, alpha: 1)
        return reusableView
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 100)
    }
    
}


//MARK: - CollectionView Delegate -
extension HomeDefaultView {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let post = posts?[indexPath.item] else {return}
        presenter?.gotToDetails(post: post)
    }
}


//MARK: - Flow Layout -
extension HomeDefaultView {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let aproximateWidthOfBioTextView = view.frame.width - 50
        let size = CGSize(width: aproximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        
        let estimatedFrame = NSString(string: posts?[indexPath.item].title ?? "").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
    }
}


//MARK: - Home View Protocol -
extension HomeDefaultView: HomeView {
    
    func reloadData() {
        collectionView.reloadData()
    }
}
