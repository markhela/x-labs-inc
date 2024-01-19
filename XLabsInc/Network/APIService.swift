//
//  APIService.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

protocol APIServiceProtocol {
    func fetchPosts() async throws -> [Post]
    func send(dto: AddDTO) async throws
}

struct APIService: HTTPClient, APIServiceProtocol {
    func fetchPosts() async throws -> [Post] {
        try await sendRequest(endpoint: APIEndpoint.fetchPhotos, responseModel: [Post].self)
    }

    func send(dto: AddDTO) async throws {
        try await sendRequest(endpoint: APIEndpoint.addPost(dto: dto), responseModel: AddDTO.self)
    }
}
