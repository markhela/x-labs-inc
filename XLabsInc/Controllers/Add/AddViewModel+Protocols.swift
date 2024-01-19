//
//  AddViewModel+Protocols.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import Foundation

protocol AddViewModelProtocol {
    func sendData(dto: AddDTO)
}

protocol AddViewModelExternalProtocol {
    func bindEvents(_ object: AnyObject, _ handler: @escaping ((AddViewModel.Event) -> Void))
}
