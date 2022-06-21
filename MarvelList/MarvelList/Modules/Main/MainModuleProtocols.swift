//
//  MainModuleProtocols.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.


import Foundation


protocol MainModuleRouterProtocol: AnyObject {

}

protocol MainModulePresenterProtocol: AnyObject {

    func getListData()
}


protocol MainModuleInteractorProtocol: AnyObject {
    
    func requestData(completion: @escaping ([MainModuleModel]) -> Void)
}


protocol MainModuleViewProtocol: AnyObject {

    
}
