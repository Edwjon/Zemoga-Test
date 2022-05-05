//
//  DetailRouter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation

protocol DetailRouter {
    
    var presenter: DetailPresenter? { get set }
    
    func goHome()
    
    func goToDetails()
}
