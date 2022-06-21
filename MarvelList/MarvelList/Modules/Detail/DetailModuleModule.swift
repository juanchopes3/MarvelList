//
//  DetailModuleModule.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.

import UIKit
import Foundation


class DetailModuleModule {

    static func build(id: Int) -> UIViewController {
        let view: DetailModuleViewController = DetailModuleViewController.loadXib()
        let interactor = DetailModuleInteractor()
        let router = DetailModuleRouter()
        let presenter = DetailModulePresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.id = id
        
        view.presenterModule = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
