//
//  DetailModulePresenter.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.

import UIKit


class DetailModulePresenter: DetailModulePresenterProtocol {
    
    weak var view: DetailModuleViewProtocol?
    var interactor: DetailModuleInteractorProtocol?
    var router: DetailModuleRouterProtocol?
    var id: Int = 0
    
    
    func getDetail() {
        
        interactor?.requestDetail(id: id, completion: { dto in
            self.view?.setDetail(data: dto)
        })
    }
    
    func goToBack() {
        router?.dissmis()
    }
    
    

}
