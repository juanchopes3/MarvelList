//
//  MainModuleRouter.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit

class MainModuleRouter: MainModuleRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func pushDetailView(id: Int) {
        let vc = DetailModuleModule.build(id: id)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

}
