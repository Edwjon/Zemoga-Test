//
//  DetailModule.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

class DetailModule {
    
    func buildDetailView(post: Post) -> UIViewController {
        
        let view = DetailDefaultView()
        let interactor = DetailDefaultInteractor()
        let presenter = DetailDefaultPresenter(post: post)
        let router = DetailDefaultRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        
        return view
    }
}
