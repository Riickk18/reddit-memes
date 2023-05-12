//
//  MemeCellViewModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

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
    @Published var people: [RemoteImageView] = []

    init(memeObject: MemeModel) {
        self.image = memeObject.thumbnail
        self.title = memeObject.title
        self.description = memeObject.selftext
        self.likeCounter = memeObject.score
        self.commentsCounter = memeObject.numComments
        self.ownerName = memeObject.author
        for index in (1...3) {
            people.append(
                RemoteImageView(url: "https://picsum.photos/80\(index)/80\(index)")
            )
        }
    }
}
