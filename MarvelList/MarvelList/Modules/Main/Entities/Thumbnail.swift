//
//  Thumbnail.swift
//  MarvelList
//
//  Created by Juan  Martinez on 20/06/22.
//

import Foundation

struct Thumbnail : Codable {
    let path : String?
    let exten : String?

    enum CodingKeys: String, CodingKey {

        case path = "path"
        case exten = "extension"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try? values.decodeIfPresent(String.self, forKey: .path)
        exten = try? values.decodeIfPresent(String.self, forKey: .exten)
    }
    
    var url: String {
        guard let base = path, let ext = exten else { return "" }
        return base + "." + ext
    }

}
