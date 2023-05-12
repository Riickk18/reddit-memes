//
//  NetworkHandler.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import Foundation

/// Class for execute network requests.
class NetworkHandler {

    let baseURL = "https://www.reddit.com/r/chile/"
    let timeOutInterval = 30.0
    var session = URLSession.shared
    
    enum ErrorMessages: String {
        case errorBuildingRequest = "Occurred an error doing the request, try again later"
        case serverError = "Server error occurred, try again later"
    }

    /// Fetch first elements, use this for first or refresh memes list
    func fetchMemes() async throws -> (FetchMemeModel?, String?) {
        let stringURL: String = baseURL + "new/.json?limit=100"
        guard let url = URL(string: stringURL) else {
            return (nil, ErrorMessages.errorBuildingRequest.rawValue)
        }
        let (data, response) = try await session.data(from: url)
        guard let http = (response as? HTTPURLResponse), http.statusCode == 200 else {
            return (nil, ErrorMessages.serverError.rawValue)
        }
        let decoder = JSONDecoder()
        return try (decoder.decode(FetchMemeModel.self, from: data), nil)
    }

    /// Search memes by specific string provided
    /// - Parameters:
    ///   - text: string to pass as parameter
    func searchMemesBy(text: String) async throws -> (FetchMemeModel?, String?) {
        let stringURL: String = baseURL + "search.json?q=\(text)&limit=100"
        guard let url = URL(string: stringURL) else {
            return (nil, ErrorMessages.errorBuildingRequest.rawValue)
        }
        let (data, response) = try await session.data(from: url)
        guard let http = (response as? HTTPURLResponse), http.statusCode == 200 else {
            return (nil, ErrorMessages.serverError.rawValue)
        }
        let decoder = JSONDecoder()
        return try (decoder.decode(FetchMemeModel.self, from: data), nil)
    }

    /// Get more memes elements by page
    /// - Parameters:
    ///   - page: string to pass as parameter
    func fetchMemesByPage(page: String) async throws -> (FetchMemeModel?, String?) {
        let stringURL: String = baseURL + ".json?limit=100&after=\(page)"
        guard let url = URL(string: stringURL) else {
            return (nil, ErrorMessages.errorBuildingRequest.rawValue)
        }
        let (data, response) = try await session.data(from: url)
        guard let http = (response as? HTTPURLResponse), http.statusCode == 200 else {
            return (nil, ErrorMessages.serverError.rawValue)
        }
        let decoder = JSONDecoder()
        return try (decoder.decode(FetchMemeModel.self, from: data), nil)
    }
}
