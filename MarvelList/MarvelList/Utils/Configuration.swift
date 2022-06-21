//
//  Configuration.swift
//  MarvelList
//
//  Created by Juan  Martinez on 21/06/22.
//

import Foundation
import PromiseKit

class Confiuguration {
    static let shared = Confiuguration()
    
    func getConfigurationValue<T>(whitType _: T.Type, key: ConfiugurationKey) -> T? {
        if let configurations = self.getConfigurationDict(path: "Constants") {
            return configurations.object(forKey: key.rawValue) as? T
        }
        return nil
    }
    
    private func getConfigurationDict(path: String) -> NSDictionary? {
        let path = path + "Configuration"
        let plistPath = Bundle.main.path(forResource: path, ofType: "plist")
        guard let data = try? NSData(contentsOfFile: plistPath ?? "") as Data else { return nil }
        
        do {
            if let dto = try PropertyListSerialization.propertyList(from: data,
                                                                    options: .mutableContainers,
                                                                    format: nil) as? [String: Any] {
                return dto as NSDictionary
            }
        } catch {
            return nil
        }
         return nil
    }
}

public struct ConfiugurationKey {
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let urlBase = ConfiugurationKey(rawValue: "URL_BASE")
    static let pathCharacters = ConfiugurationKey(rawValue: "PATH_CHARACTERS")
    static let publicKey = ConfiugurationKey(rawValue: "PUBLIC_KEY")
    static let privateKey = ConfiugurationKey(rawValue: "PRIVATE_KEY")

}


public extension String {
    
    static func getConfigurartionValue(forKey key: ConfiugurationKey ) -> String {
        return Confiuguration.shared.getConfigurationValue(whitType: String.self, key: key) ?? ""
    }
}

