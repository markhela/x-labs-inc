//
//  PostViewModel.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension PostViewModel {
    enum Action: Actionable {
    }

    enum Event: Eventable {
    }
}

class PostViewModel: BaseViewModel<PostViewModel.Action, PostViewModel.Event>, PostViewModelProtocol, PostViewModelExternalProtocol {
    override func postInitialActions() {

    }
}

// MARK: - private functions
private extension PostViewModel {

}
