//
//  DetailViewController.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit

class DetailViewController: BaseViewController<DetailViewModelProtocol, DetailViewModel> {

    // MARK: - Setup
    override func setupUI() {
        navigationItem.title = "Detail"
        view.backgroundColor = .systemBackground
    }

    override func configureBindings(with viewModel: DetailViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {

            }
        }
    }
}

// MARK: - private functions
private extension DetailViewController {

}
