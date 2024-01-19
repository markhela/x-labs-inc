//
//  PostViewModel+Protocols.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import Foundation

protocol PostViewModelProtocol {
    var post: Post { get }
}

protocol PostViewModelExternalProtocol {
    func bindEvents(_ object: AnyObject, _ handler: @escaping ((PostViewModel.Event) -> Void))
}
