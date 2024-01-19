//
//  AddViewModel.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit

extension AddViewModel {
    enum Action: Actionable {
    }

    enum Event: Eventable {
    }
}

class AddViewModel: BaseViewModel<AddViewModel.Action, AddViewModel.Event>, AddViewModelProtocol, AddViewModelExternalProtocol {
    override func postInitialActions() {

    }
}

// MARK: - private functions
private extension AddViewModel {

}
