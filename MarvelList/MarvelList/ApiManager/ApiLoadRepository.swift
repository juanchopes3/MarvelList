//
//  ApiLoadRepository.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation
import PromiseKit
import Alamofire


protocol ApiLoadRepositoryProtocol {
    func getListData() -> Promise<[MainModuleModel]>
    func getlistSearch(value: String) -> Promise<[MainModuleModel]>
}


public class ApiLoadRepository: ApiLoadRepositoryProtocol {
    
    private var apiflowManager = ApiData(ApiflowManager())
    
    func getListData() -> Promise<[MainModuleModel]> {
        let router =  apiflowManager.apiData(route: .getData)
        return request(router)
    }
    
    func getlistSearch(value: String) -> Promise<[MainModuleModel]> {
        let router = apiflowManager.apiData(route: .getSearch(value))
        return request(router)
    }
}


public func request<T>(_ router: Routeable,
                       body: [String: String]? = nil) -> Promise<T> {
    
    guard let request = try? router.asUrlRequest() else {
        return Promise.init(error: AFError.explicitlyCancelled)
    }
    
    return Promise { seal in
        AF.request(request)
            .validate()
            .responseJSON { (responseData) in
                
                switch responseData.result{
                case .success:
                    decodeData(dataResponse: responseData.data) { (result) in
                        seal.fulfill(result as! T)
                    }

                case .failure(let error):
                    print(error)
                }
            }
    }
}

private func decodeData(dataResponse: Data?,
                        completion: @escaping(_ result: [MainModuleModel]?) -> Void)  {
    
    guard let dataResponse = dataResponse else { return completion(nil) }
    let json = try? JSONSerialization.jsonObject(with: dataResponse, options: [])
    guard let data: [String : Any] = json as? [String : Any],
          let dataDict: [String : Any] = data["data"] as? [String : Any],
          let resultsArray: [[String : Any]] = dataDict["results"] as? [[String : Any]] else {
              return completion(nil)
          }
    var itmes: [MainModuleModel] = []
    for item in resultsArray {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: item,
                                                      options: .prettyPrinted)
            let item = try JSONDecoder().decode(MainModuleModel.self, from: jsonData)
            itmes.append(item)
        } catch ( let error ) {
            print(error.localizedDescription)
        }
    }
    completion(itmes)
    
}
