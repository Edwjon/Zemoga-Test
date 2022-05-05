//
//  BaseService.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import Alamofire


class BaseService {
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/"
    
    typealias postsCallBack = (_ posts:[Post]?,_ status:Bool,_ message: String) -> Void
    var postsCallBack: postsCallBack?
    
    typealias userCallBack = (_ user:[User]?,_ status:Bool,_ message: String) -> Void
    var userCallBack: userCallBack?
    
    typealias commentsCallBack = (_ user:[Comment]?,_ status:Bool,_ message: String) -> Void
    var commentsCallBack: commentsCallBack?
    
    //MARK: - Get Posts -
    func getAllPosts() {
        
        AF.request(self.baseUrl + "posts", method: .get).responseJSON { (response) in
            
            guard let data = response.data else {
                self.postsCallBack?(nil, false, "")
                return
            }
            
            do {
                let _posts = try JSONDecoder().decode([Post].self, from: data)
                self.postsCallBack?(_posts, true, "")
                
            } catch {
                print(error.localizedDescription)
                self.postsCallBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    
    func completionHandler(callBack: @escaping postsCallBack) {
        self.postsCallBack = callBack
    }
    
    
    func getUser(userId: Int) {
        
        AF.request(self.baseUrl + "users?id=\(userId)", method: .get).responseJSON { (response) in
            
            guard let data = response.data else {
                self.userCallBack?(nil, false, "")
                return
            }
            
            do {
                let _posts = try JSONDecoder().decode([User].self, from: data)
                self.userCallBack?(_posts, true, "")
                
            } catch {
                self.userCallBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func userCompletionHandler(callBack: @escaping userCallBack) {
        self.userCallBack = callBack
    }
    
    
    func getComments(postId: Int) {
        
        AF.request(self.baseUrl + "comments?postId=\(postId)", method: .get).responseJSON { (response) in
            
            guard let data = response.data else {
                self.commentsCallBack?(nil, false, "")
                return
            }
            
            do {
                let _posts = try JSONDecoder().decode([Comment].self, from: data)
                self.commentsCallBack?(_posts, true, "")
                
            } catch {
                self.commentsCallBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func commentsCompletionHandler(callBack: @escaping commentsCallBack) {
        self.commentsCallBack = callBack
    }
    
    
}

