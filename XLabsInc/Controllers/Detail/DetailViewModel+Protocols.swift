//
//  DetailViewModel+Protocols.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit

protocol DetailViewModelProtocol {
    func shareImage(_ image: UIImage)
}

protocol DetailViewModelExternalProtocol {
    func bindEvents(_ object: AnyObject, _ handler: @escaping ((DetailViewModel.Event) -> Void))
}
