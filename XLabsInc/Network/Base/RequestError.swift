//
//  RequestError.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import Foundation

enum RequestError: LocalizedError {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var errorDescription: String? {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
