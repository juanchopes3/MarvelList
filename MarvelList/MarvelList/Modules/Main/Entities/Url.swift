//
//  Url.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation

struct Urls : Codable {
    let type : String?
    let url : String?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try? values.decodeIfPresent(String.self, forKey: .type)
        url = try? values.decodeIfPresent(String.self, forKey: .url)
    }

}
