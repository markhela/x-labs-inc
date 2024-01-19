//
//  MainViewModel+Protocols.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import Foundation

protocol MainViewModelProtocol {
    func fetchPosts()
}

protocol MainViewModelExternalProtocol {
    func bindEvents(_ object: AnyObject, _ handler: @escaping ((MainViewModel.Event) -> Void))
}