//
//  APIService.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPosts() async throws -> [Post]
    func send(dto: AddDTO) async throws
}

class APIService: APIServiceProtocol {

    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            throw APIServiceError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw APIServiceError.unknownError
        }
        let photos = try JSONDecoder().decode([Post].self, from: data)
        return photos
    }

    func send(dto: AddDTO) async throws {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw APIServiceError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")

        do {
            request.httpBody = try JSONEncoder().encode(dto)
        } catch {
            throw error
        }

        let (_, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw APIServiceError.unknownError
        }
    }
}

enum APIServiceError: LocalizedError {
    case invalidURL
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .unknownError:
            return "Unknown error"
        }
    }
}
