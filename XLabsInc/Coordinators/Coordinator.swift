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
        let mainViewController = MainViewController(with: mainViewModel)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

// MARK: - private functions
private extension Coordinator {

}
