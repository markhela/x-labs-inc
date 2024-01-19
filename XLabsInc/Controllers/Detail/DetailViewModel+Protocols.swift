//
//  DetailViewModel+Protocols.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import Foundation

protocol DetailViewModelProtocol {

}

protocol DetailViewModelExternalProtocol {
    func bindEvents(_ object: AnyObject, _ handler: @escaping ((DetailViewModel.Event) -> Void))
}
