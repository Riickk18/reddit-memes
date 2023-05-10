//
//  FetchMemeModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation

struct FetchMemeModel: Decodable {
    var data: FetchMemeDataModel
    
    struct FetchMemeDataModel: Decodable {
        var after: String?
        var children: [MemeModelObject]
    }
}
