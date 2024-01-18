//
//  MainCoordinator.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension MainCoordinator {
    enum Event: Eventable {

    }
}

class MainCoordinator: BaseCoordinator<MainCoordinator.Event> {
    private let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
        super.init()
    }

    func start() {
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

// MARK: - private functions
private extension MainCoordinator {

}
