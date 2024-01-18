//
//  MainViewModel.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension MainViewModel {
    enum Action: Actionable {
        case isLoading(Bool)
        case setPosts([PostViewModelProtocol])
    }

    enum Event: Eventable {
    }
}

class MainViewModel: BaseViewModel<MainViewModel.Action, MainViewModel.Event>, MainViewModelProtocol, MainViewModelExternalProtocol {
    
    private let postsAPIService: PostAPIServiceProtocol = PostAPIService()

    override func postInitialActions() {
    }

    func fetchPosts() {
        post(.isLoading(true))
        Task {
            do {
                let fetchedPosts = try await postsAPIService.fetchPosts()
                let postsViewModels = fetchedPosts.map { PostViewModel(photo: $0) }
                post(.isLoading(false))
                post(.setPosts(postsViewModels))
            } catch {
                dump(error)
            }
        }
    }
}

// MARK: - private functions
private extension MainViewModel {

}
