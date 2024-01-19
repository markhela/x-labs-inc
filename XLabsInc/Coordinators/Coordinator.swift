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
    private var navigationController: UINavigationController?

    init(window: UIWindow?) {
        self.window = window
        super.init()
    }

    func start() {
        let mainViewModel = MainViewModel()
        let mainViewController = MainViewController(with: mainViewModel)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        self.navigationController = navigationController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        mainViewModel.bindEvents(self) { [weak self] event in
            guard let self else { return }
            switch event {
            case .showError(let error):
                self.showDefaultAlert(with: error.localizedDescription)
            case .showDetail(let post):
                self.showDetail(post: post)
            case .showAdd:
                self.showAdd()
            }
        }
    }

    func showWokeUpAlert() {
        self.showDefaultAlert(with: "I woke up")
    }
}

// MARK: - private functions
private extension Coordinator {

    func showDetail(post: Post) {
        let detailViewModel = DetailViewModel(post: post)
        let detailViewController = DetailViewController(with: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)

        detailViewModel.bindEvents(self) { [weak self, weak detailViewController] event in
            guard let self, let detailViewController else { return }
            switch event {
            case .showShare(let image):
                self.showShare(image: image,
                               from: detailViewController,
                               sourceView: detailViewController.imageView)
            }
        }
    }

    func showShare(image: UIImage, from viewController: UIViewController, sourceView: UIView) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = sourceView
        viewController.present(activityViewController, animated: true)
    }

    func showAdd() {
        let addViewModel = AddViewModel()
        let addViewController = AddViewController(with: addViewModel)
        navigationController?.pushViewController(addViewController, animated: true)

        addViewModel.bindEvents(self) { [weak self] event in
            guard let self else { return }
            switch event {
            case .showError(let error):
                self.showDefaultAlert(with: error.localizedDescription)
            case .showSuccess:
                self.showDefaultAlert(with: "Success")
            }
        }
    }
}
