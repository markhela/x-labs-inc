//
//  Endpoint.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "jsonplaceholder.typicode.com"
    }
}
