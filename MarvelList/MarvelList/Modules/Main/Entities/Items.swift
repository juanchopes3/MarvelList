//
//  Items.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation
struct Items : Codable {
    let resourceURI : String?
    let name : String?
    let type:  String?

    enum CodingKeys: String, CodingKey {

        case resourceURI = "resourceURI"
        case name = "name"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resourceURI = try? values.decodeIfPresent(String.self, forKey: .resourceURI)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        type = try? values.decodeIfPresent(String.self, forKey: .type)
    }

}
