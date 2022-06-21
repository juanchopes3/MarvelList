//
//  MainModuleInteractor.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.

import UIKit


class MainModuleInteractor: MainModuleInteractorProtocol {

    weak var presenter: MainModulePresenterProtocol?
    
    func requestData(completion: @escaping ([MainModuleModel]) -> Void) {
        let api = ApiLoadRepository()
        let apiDataLoader = ApiDataLoaderPromise(api: api)
        
        apiDataLoader.getList { result in
            switch result {
            case .success(let dto):
                completion(dto)
            case .failure(_):
                
                break
            }
        }
    }
    
    func requestDataBySearch(value: String, completion: @escaping ([MainModuleModel]) -> Void) {
        let api = ApiLoadRepository()
        let apiDataLoader = ApiDataLoaderPromise(api: api)
        
        apiDataLoader.getSearch(value: value) { result in
            switch result {
            case .success(let dto):
                completion(dto)
            case .failure(_):
                
                break
            }
        }
    }
}
