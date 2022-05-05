//
//  DetailView.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

protocol DetailView: AnyObject {
    
    var presenter: DetailPresenter? { get set }
    
    var users: [User]? { get set }
    var comments: [Comment]? { get set }
    
    func reloadData()
}
