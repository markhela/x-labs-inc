//
//  MainViewModel.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension MainViewModel {
    enum Action: Actionable {
    }

    enum Event: Eventable {
    }
}

class MainViewModel: BaseViewModel<MainViewModel.Action, MainViewModel.Event>, MainViewModelProtocol, MainViewModelExternalProtocol {
    override func postInitialActions() {

    }
}

// MARK: - private functions
private extension MainViewModel {

}
