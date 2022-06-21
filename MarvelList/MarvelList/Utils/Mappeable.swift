//
//  Mappeable.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation

public protocol ResultType {
    associatedtype Result: Decodable
}


public protocol Mappeable {
    func map<T>(_ data: Data) -> T?
}

public protocol MappeableType: ResultType, Mappeable {
    func decode(_ data: Data) -> Result?
}
public extension MappeableType {
    func decode(_ data: Data) -> Result? {
        try?  JSONDecoder().decode(Result.self, from: data)
    }
}
