//
//  Endpoints.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import Foundation

enum APIEndpoint {
    case fetchPhotos
    case addPost(dto: AddDTO)
}

extension APIEndpoint: Endpoint {
    var path: String {
        switch self {
        case .fetchPhotos:
            return "/photos"
        case .addPost:
            return "/posts"
        }
    }

    var method: RequestMethod {
        switch self {
        case .fetchPhotos:
            return .get
        case .addPost:
            return .post
        }
    }

    var header: [String: String]? {
        switch self {
        case .addPost:
            return ["Content-Type": "application/json;charset=utf-8"]
        default:
            return nil
        }
    }

    var body: [String: Any]? {
        switch self {
        case .addPost(let dto):
            return dto.dictionary
        default:
            return nil
        }
    }
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
