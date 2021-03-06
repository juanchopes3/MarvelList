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
            self.view?.setItems(data: dto)
        })
    }
    
    func goToDetailView(id: Int) {
        router?.pushDetailView(id: id)
    }
    
    func getListSearch(value: String) {
        interactor?.requestDataBySearch(value: value, completion: { dto in
            self.view?.setItems(data: dto)
        })
    }

}
