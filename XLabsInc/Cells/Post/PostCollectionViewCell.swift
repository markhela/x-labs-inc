//
//  PostCollectionViewCell.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

class PostCollectionViewCell: BaseCollectionViewCell<PostViewModelProtocol, PostViewModel> {
    // MARK: - Subviews

    // MARK: - Setup
    override func setupUI() {
        contentView.backgroundColor = .systemTeal
    }

    override func configureBindings(with viewModel: PostViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {

            }
        }
    }
}

// MARK: - private functions
private extension PostCollectionViewCell {

}
