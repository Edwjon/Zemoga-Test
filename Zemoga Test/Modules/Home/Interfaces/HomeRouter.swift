//
//  HomeRouter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

protocol HomeRouter {
    
    var presenter: HomePresenter? { get set }
    
    func goToDetails(post: Post)
}
