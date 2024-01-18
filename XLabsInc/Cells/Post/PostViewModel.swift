//
//  PostViewModel.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension PostViewModel {
    enum Action: Actionable {
        case setTitle(String)
        case setThumbnailUrl(String)
    }

    enum Event: Eventable {
    }
}

class PostViewModel: BaseViewModel<PostViewModel.Action, PostViewModel.Event>, PostViewModelProtocol, PostViewModelExternalProtocol {

    private let photo: Post

    init(photo: Post) {
        self.photo = photo
    }

    override func postInitialActions() {
        post(.setTitle(photo.title))
        post(.setThumbnailUrl(photo.thumbnailUrl))
    }
}

// MARK: - private functions
private extension PostViewModel {

}
