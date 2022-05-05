//
//  HomeDefaultRouter.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

class HomeDefaultRouter {
    weak var presenter: HomePresenter?
    weak var viewController: UIViewController?
}

extension HomeDefaultRouter: HomeRouter {
    
    func goToDetails(post: Post) {
        let vc = DetailModule().buildDetailView(post: post)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
