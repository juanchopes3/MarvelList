//
//  MainModulePresenter.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit


class MainModulePresenter: MainModulePresenterProtocol {

    weak var view: MainModuleViewProtocol?
    var interactor: MainModuleInteractorProtocol?
    var router: MainModuleRouterProtocol?
    
    
    func getListData() {
        interactor?.requestData(completion: { dto in
            print(dto)
        })
    }

}
