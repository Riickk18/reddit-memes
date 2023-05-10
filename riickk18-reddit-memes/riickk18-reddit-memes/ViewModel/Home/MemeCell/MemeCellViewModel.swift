//
//  MemeCellViewModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation
import SwiftUI

class MemeCellViewModel: ObservableObject {
    @Published var image: String = ""
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var likeCounter: Int = 0
    @Published var commentsCounter: Int = 0
    @Published var featurePeople: [String] = []
    @Published var ownerImage: String = ""
    @Published var ownerName: String = ""
}
