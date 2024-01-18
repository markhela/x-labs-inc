//
//  PostAPIService.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import Foundation

protocol PostAPIServiceProtocol {
    func fetchPosts() async throws -> [Post]
}

class PostAPIService: PostAPIServiceProtocol {

    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            throw PhotosAPIServiceError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let photos = try JSONDecoder().decode([Post].self, from: data)
        return photos
    }
}

enum PhotosAPIServiceError: Error {
    case invalidURL
}
