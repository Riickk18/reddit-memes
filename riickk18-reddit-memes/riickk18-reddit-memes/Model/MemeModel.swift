//
//  MemeModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation

struct MemeModel: Codable {
    var title: String?
    var url: String?
    var thumbnail: String?
    var score: Int?
    var num_comments: Int?
    var link_flair_richtext: [LinkFlairRichtextModel]?
}
