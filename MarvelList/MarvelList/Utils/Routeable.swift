//
//  Routeable.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation
import Alamofire

public protocol BaseUrl {
    var baseUrl: String { get }
}

public protocol Routeable: BaseUrl {
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var mapper: Mappeable { get }
    var parameters: Parameters? { get }
}

extension Routeable {
    func asUrlRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
