//
//  MainModuleModule.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit
import Foundation


class MainModuleModule {

    static func build() -> UIViewController {        
        let view: MainModuleViewController = MainModuleViewController.loadXib()
        let interactor = MainModuleInteractor()
        let router = MainModuleRouter()
        let presenter = MainModulePresenter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenterModule = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
