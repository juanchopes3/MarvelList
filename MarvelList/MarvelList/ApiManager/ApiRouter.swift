//
//  ApiRouter.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation
import Alamofire

public enum ApiRoute {
    case getData, getDetail
}


public protocol ApiRouteable: Routeable {
    var route: ApiRoute { get set }
}

extension ApiRouteable {
    
    var baseUrl: String {
        return  String.getConfigurartionValue(forKey: .urlBase)
    }
    
    var path: String {
        
        return   String.getConfigurartionValue(forKey: .pathCharacters)
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        
        let ts = String(Date().timeIntervalSince1970)
        let urlParams = [
          "ts" : ts,
          "hash" : MD5(string: ts + String.getConfigurartionValue(forKey: .privateKey) + String.getConfigurartionValue(forKey: .publicKey)),
          "apikey" : String.getConfigurartionValue(forKey: .publicKey),
          "limit" : "50"
        ]
        return urlParams
    }
    
    var mapper: Mappeable {
        return ApiLoadMapper()
    }
}

struct ApiRouter: ApiRouteable {
    
    var route: ApiRoute = .getData
}
