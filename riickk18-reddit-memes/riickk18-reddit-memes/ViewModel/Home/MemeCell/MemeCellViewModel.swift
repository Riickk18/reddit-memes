//
//  MemeCellViewModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation
import SwiftUI

class MemeCellViewModel: ObservableObject {
    @Published var image: String?
    @Published var title: String?
    @Published var description: String?
    @Published var likeCounter: Int?
    @Published var commentsCounter: Int?
    @Published var featurePeople: [String] = []
    @Published var ownerImage: String?
    @Published var ownerName: String?
    
    init(memeObject: MemeModel) {
        self.image = memeObject.thumbnail
        self.title = memeObject.title
        self.description = memeObject.selftext
        self.likeCounter = memeObject.score
        self.commentsCounter = memeObject.numComments
        self.ownerName = memeObject.author
    }
}
