//
//  ApiLoadMapper.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation

struct ApiLoadMapper: MappeableType {
    
    typealias Result = [MainModuleModel]
    
    func map<T>(_ data: Data) -> T? {
        return decode(data) as? T
    }
}

struct ApiDetailMapper: MappeableType {
    
    typealias Result = MainModuleModel
    
    func map<T>(_ data: Data) -> T? {
        return decode(data) as? T
    }
}
