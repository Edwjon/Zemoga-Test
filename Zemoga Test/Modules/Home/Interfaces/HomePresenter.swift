//
//  HomePresenter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

protocol HomePresenter: AnyObject {
    
    var router: HomeRouter? { get set }
    var interactor: HomeInteractor? { get set }
    var view: HomeView? { get set }
      
    func getContents()
    func gotToDetails(post: Post)
}
