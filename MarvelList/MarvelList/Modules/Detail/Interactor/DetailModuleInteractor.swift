//
//  DetailModuleInteractor.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.

import UIKit


class DetailModuleInteractor: DetailModuleInteractorProtocol {

    weak var presenter: DetailModulePresenterProtocol?
    
    func requestDetail(id: Int, completion: @escaping (MainModuleModel) -> Void) {
        let api = ApiLoadRepository()
        let apiDataLoader = ApiDataLoaderPromise(api: api)
        
        apiDataLoader.getDetail(id: id) { result in
            switch result {
            case .success(let dto):
                completion(dto)
            case .failure(_):
                
                break
            }
        }
    }
}
