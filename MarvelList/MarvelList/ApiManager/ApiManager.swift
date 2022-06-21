//
//  ApiManager.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation

public protocol ApiManagerProtocol {
    var apiManager: ApiRouteable { get set}
}

public struct ApiflowManager: ApiManagerProtocol {
    public init() { }
    public var apiManager: ApiRouteable = ApiRouter()
}


public struct ApiData {
    private var api: ApiManagerProtocol
    
    init(_ api: ApiManagerProtocol) {
        self.api = api
    }
}

public extension ApiData {
    mutating func apiData(route: ApiRoute) -> Routeable {
        api.apiManager.route = route
        return api.apiManager
    }
}
