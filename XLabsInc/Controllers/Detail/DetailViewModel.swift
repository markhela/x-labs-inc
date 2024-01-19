//
//  DetailViewModel.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit

extension DetailViewModel {
    enum Action: Actionable {
        case setTitle(String)
        case setImageURL(String)
    }

    enum Event: Eventable {
        case showShare(UIImage)
    }
}

class DetailViewModel: BaseViewModel<DetailViewModel.Action, DetailViewModel.Event>, DetailViewModelProtocol, DetailViewModelExternalProtocol {

    private let post: Post

    init(post: Post) {
        self.post = post
        super.init()
    }

    override func postInitialActions() {
        post(.setTitle(post.title))
        post(.setImageURL(post.url))
    }

    func shareImage(_ image: UIImage) {
        postEvent(.showShare(image))
    }
}

// MARK: - private functions
private extension DetailViewModel {

}
