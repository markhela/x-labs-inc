//
//  Photo.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import Foundation

struct Photo: Codable {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
