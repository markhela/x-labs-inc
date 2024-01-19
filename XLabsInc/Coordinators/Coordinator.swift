//
//  Coordinator.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension Coordinator {
    enum Event: Eventable {

    }
}

class Coordinator: BaseCoordinator<Coordinator.Event> {
    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        super.init()
    }

    func start() {
        let mainViewModel = MainViewModel()
        mainViewModel.bindEvents(self) { [weak self] event in
            guard let self else { return }
            switch event {
            case .showError(let error):
                self.showDefaultAlert(with: error.localizedDescription)
            }
        }
        
        let mainViewController = MainViewController(with: mainViewModel)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

// MARK: - private functions
private extension Coordinator {

}