//
//  HomeDefaultPresenter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

class HomeDefaultPresenter {
    var router: HomeRouter?
    var interactor: HomeInteractor?
    var view: HomeView?
}

extension HomeDefaultPresenter: HomePresenter {
    
    func getContents() {
        let service = BaseService()
        service.getAllPosts()

        service.completionHandler { [weak self] (posts, status, message) in
            if status {
                guard let self = self else {return}
                guard let _posts = posts else {return}
                self.view?.posts = _posts
                self.view?.reloadData()
            }
        }
    }
    
    func gotToDetails(post: Post) {
        router?.goToDetails(post: post)
    }
}

