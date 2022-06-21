//
//  DetailModuleProtocols.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.


import Foundation



protocol DetailModuleRouterProtocol: AnyObject {

    func dissmis()
}

protocol DetailModulePresenterProtocol: AnyObject {
    var id: Int { get set}
    
    func getDetail()
    func goToBack()

}


protocol DetailModuleInteractorProtocol: AnyObject {

    func requestDetail(id: Int, completion: @escaping (MainModuleModel) -> Void)
}


protocol DetailModuleViewProtocol: AnyObject {
    
    func setDetail(data: MainModuleModel)

}
