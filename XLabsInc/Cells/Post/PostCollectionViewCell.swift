//
//  PostCollectionViewCell.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit
import SnapKit

class PostCollectionViewCell: BaseCollectionViewCell<PostViewModelProtocol, PostViewModel> {
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Setup
    override func setupUI() {
        contentView.backgroundColor = .systemBackground

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
            make.bottom.equalTo(-8)
        }
    }

    override func configureBindings(with viewModel: PostViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {
            case .setTitle(let title):
                self.titleLabel.text = title
            }
        }
    }
}

// MARK: - private functions
private extension PostCollectionViewCell {

}
