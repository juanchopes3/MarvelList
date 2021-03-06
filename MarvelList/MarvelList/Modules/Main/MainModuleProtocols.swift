//
//  MainModuleProtocols.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.


import Foundation


protocol MainModuleRouterProtocol: AnyObject {
    func pushDetailView(id: Int)

}

protocol MainModulePresenterProtocol: AnyObject {

    func getListData()
    func getListSearch(value: String)
    func goToDetailView(id: Int)
}


protocol MainModuleInteractorProtocol: AnyObject {
    
    func requestData(completion: @escaping ([MainModuleModel]) -> Void)
    func requestDataBySearch(value: String, completion: @escaping ([MainModuleModel]) -> Void)
}


protocol MainModuleViewProtocol: AnyObject {
    
    func setItems(data: [MainModuleModel])
    
}
