//
//  ApiRouter.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation
import Alamofire

public enum ApiRoute {
    case getData, getDetail(Int), getSearch(String)
}


public protocol ApiRouteable: Routeable {
    var route: ApiRoute { get set }
}

extension ApiRouteable {
    
    var baseUrl: String {
        return  String.getConfigurartionValue(forKey: .urlBase)
    }
    
    var path: String {
        switch route {
        case .getDetail(let id):
            return String.getConfigurartionValue(forKey: .pathCharacters) + "/" +  String(id)
        default:
            return   String.getConfigurartionValue(forKey: .pathCharacters)
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var parameters: Parameters? {
        
        let ts = String(Date().timeIntervalSince1970)
        var urlParams = [
          "ts" : ts,
          "hash" : MD5(string: ts + String.getConfigurartionValue(forKey: .privateKey) + String.getConfigurartionValue(forKey: .publicKey)),
          "apikey" : String.getConfigurartionValue(forKey: .publicKey),
          "limit" : "50"
        ]
        
        switch route {
        case .getSearch(let value):
            urlParams.updateValue(value, forKey: "nameStartsWith")
        default: break
        }
        return urlParams
    }
    
    var mapper: Mappeable {
        return ApiLoadMapper()
    }
}

struct ApiRouter: ApiRouteable {
    
    var route: ApiRoute = .getData
}
