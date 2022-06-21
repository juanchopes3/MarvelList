//
//  DetailModuleRouter.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.

import UIKit

class DetailModuleRouter: DetailModuleRouterProtocol {

    weak var viewController: UIViewController?

    
    func dissmis() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
