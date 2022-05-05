//
//  HomeView.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

protocol HomeView: AnyObject {
    
    var presenter: HomePresenter? { get set }
    
    var posts: [Post]? { get set }
    
    func reloadData()
}
