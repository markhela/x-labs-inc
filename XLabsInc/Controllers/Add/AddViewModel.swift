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
        case showError(Error)
        case showSuccess
    }
}

class AddViewModel: BaseViewModel<AddViewModel.Action, AddViewModel.Event>, AddViewModelProtocol, AddViewModelExternalProtocol {

    private let apiService: APIServiceProtocol = APIService()

    override func postInitialActions() {

    }

    func sendData(dto: AddDTO) {
        Task {
            do {
                try await apiService.send(dto: dto)
                postEvent(.showSuccess)
            } catch {
                postEvent(.showError(error))
            }
        }
    }
}

// MARK: - private functions
private extension AddViewModel {

}
