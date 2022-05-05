//
//  DetailPresenter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

protocol DetailPresenter: AnyObject {
    
    var router: DetailRouter? { get set }
    var interactor: DetailInteractor? { get set }
    var view: DetailView? { get set }
    
    func getUser()
    func getComents()
    func getPostDescription() -> String
    func getPostId() -> Int
}
