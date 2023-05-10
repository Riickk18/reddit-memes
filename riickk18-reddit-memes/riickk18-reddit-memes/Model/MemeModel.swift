//
//  MemeModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation

struct MemeModel: Decodable {
    var title: String?
    var selftext: String?
    var url: String?
    var thumbnail: String?
    var score: Int?
    var numComments: Int?
    var linkFlairRichtext: [LinkFlairRichtextModel]?
    var author: String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case selftext
        case url
        case thumbnail
        case score
        case numComments = "num_comments"
        case linkFlairRichtext = "link_flair_richtext"
        case author
    }
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try? container.decodeIfPresent(String.self, forKey: .title)
        selftext = try? container.decodeIfPresent(String.self, forKey: .selftext)
        url = try? container.decodeIfPresent(String.self, forKey: .url)
        thumbnail = try? container.decodeIfPresent(String.self, forKey: .thumbnail)
        score = try? container.decodeIfPresent(Int.self, forKey: .score)
        numComments = try? container.decodeIfPresent(Int.self, forKey: .numComments)
        linkFlairRichtext = try? container.decodeIfPresent([LinkFlairRichtextModel].self, forKey: .linkFlairRichtext)
        author = try? container.decodeIfPresent(String.self, forKey: .author)
    }
}
