//
//  HomeModule.swift
//  Zemoga Test
//
//  Created by Edward Pizzurro Fortun on 4/5/22.
//

import Foundation
import UIKit

class HomeModule {
    
    func buildSearcher() -> UIViewController {
        
        let view = HomeDefaultView()
        let interactor = HomeDefaultInteractor()
        let presenter = HomeDefaultPresenter()
        let router = HomeDefaultRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        router.presenter = presenter
        
        return view
    }
}
