//
//  MainModuleViewController.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit


class MainModuleViewController: UIViewController {

	var presenterModule: MainModulePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MainModuleViewController: MainModuleViewProtocol  {
    
}

extension MainModuleViewController {
    
}

