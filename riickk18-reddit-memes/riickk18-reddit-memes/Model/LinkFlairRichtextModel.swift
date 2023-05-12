//
//  LinkFlairRichtextModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation

struct LinkFlairRichtextModel: Decodable {
    var type: String?
    var category: String?

    private enum CodingKeys: String, CodingKey {
        case type = "e"
        case category = "t"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try? container.decodeIfPresent(String.self, forKey: .type)
        category = try? container.decodeIfPresent(String.self, forKey: .category)
    }
}
