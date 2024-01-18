//
//  PhotosAPIService.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import Foundation

protocol PhotosAPIServiceProtocol {
    func fetchPhotos() async throws -> [Photo]
}

class PhotosAPIService: PhotosAPIServiceProtocol {

    func fetchPhotos() async throws -> [Photo] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            throw PhotosAPIServiceError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let photos = try JSONDecoder().decode([Photo].self, from: data)
        return photos
    }
}

enum PhotosAPIServiceError: Error {
    case invalidURL
}
