//
//  DetailDefaultRouter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

class DetailDefaultRouter {
    weak var presenter: DetailPresenter?
    weak var viewController: UINavigationController?
}

extension DetailDefaultRouter: DetailRouter {
    
    func goHome() {
        self.viewController?.navigationController!.dismiss(animated: true, completion: nil)
    }
    
    func goToDetails() {
        
    }
}
