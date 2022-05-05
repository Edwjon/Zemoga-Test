//
//  DetailDefaultPresenter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

class DetailDefaultPresenter {
    var router: DetailRouter?
    var interactor: DetailInteractor?
    var view: DetailView?
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
}

extension DetailDefaultPresenter: DetailPresenter {
    
    
    func getUser() {
        let service = BaseService()
        service.getUser(userId: post.userId ?? 1)
        service.userCompletionHandler { [weak self] (users, status, message) in
            if status {
                guard let self = self else {return}
                guard let _users = users else {return}
                self.view?.users = _users
                self.view?.reloadData()
            }
        }
    }
    
    func getComents() {
        let service = BaseService()
        service.getComments(postId: (post.id) ?? 1)
        service.commentsCompletionHandler { [weak self] (comments, status, message) in
            if status {
                guard let self = self else {return}
                guard let _comments = comments else {return}
                self.view?.comments = _comments
                self.view?.reloadData()
            }
        }
    }
    
    func getPostDescription() -> String {
        return post.body ?? "Not Title"
    }
    
    func getPostId() -> Int {
        return (post.id) ?? 1
    }
}
