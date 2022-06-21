//
//  ApiDataLoader.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation
import PromiseKit

protocol ApiDataLoaderProtocol {
    typealias Result = Swift.Result<[MainModuleModel], Error>
    
    func getList(completion: @escaping (Result) -> Void)
}

final class ApiDataLoaderPromise: ApiDataLoaderProtocol {
    private let api: ApiLoadRepositoryProtocol
    
    init(api : ApiLoadRepositoryProtocol) {
        self.api = api
    }
    
    func getList(completion: @escaping (ApiDataLoaderProtocol.Result) -> Void) {
        
        firstly{
            api.getListData()
        }.done { resultData in
            completion(.success(resultData))
        }.catch { (error) in
            completion(.failure(error))
        }
    }
}
