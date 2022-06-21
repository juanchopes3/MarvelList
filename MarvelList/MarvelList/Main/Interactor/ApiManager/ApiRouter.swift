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
        return "https://gateway.marvel.com"
    }
    
    var path: String {
        
        return "/v1/public/characters"
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
          "hash" : MD5(string: ts + "4889843acbe5ad9a43e2c142780572f0b10035de" + "2c236a8d709dc4df0d2b7dfb5aaf0f0e"),
          "apikey" : "2c236a8d709dc4df0d2b7dfb5aaf0f0e"]
        return urlParams
    }
    
    var mapper: Mappeable {
        return ApiLoadMapper()
    }
}

struct ApiRouter: ApiRouteable {
    
    var route: ApiRoute = .getData
}
