//
//  NetworkHandler.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation

class NetworkHandler {
    
    let baseURL = "https://www.reddit.com/r/chile/"
    let timeOutInterval = 30.0
    var session = URLSession.shared

    func fetchMemes() async throws -> FetchMemeModel? {
        let stringURL: String = baseURL + "new/.json?limit=100"
        guard let url = URL(string: stringURL) else {return nil}
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(FetchMemeModel.self, from: data)
    }
}
