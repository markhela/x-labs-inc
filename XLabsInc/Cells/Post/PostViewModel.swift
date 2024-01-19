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

    let post: Post

    init(post: Post) {
        self.post = post
    }

    override func postInitialActions() {
        post(.setTitle(post.title))
        post(.setThumbnailUrl(post.thumbnailUrl))
    }
}

// MARK: - private functions
private extension PostViewModel {

}
