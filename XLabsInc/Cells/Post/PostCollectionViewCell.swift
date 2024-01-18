//
//  PostCollectionViewCell.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit
import SnapKit
import SDWebImage

class PostCollectionViewCell: BaseCollectionViewCell<PostViewModelProtocol, PostViewModel> {
    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.medium
        return imageView
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
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
            make.bottom.equalTo(titleLabel.snp.top).offset(-8)
        }
    }

    override func configureBindings(with viewModel: PostViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {
            case .setTitle(let title):
                self.titleLabel.text = title
            case .setThumbnailUrl(let urlString):
                self.imageView.sd_setImage(with: URL(string: urlString))
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        imageView.image = nil
    }
}

// MARK: - private functions
private extension PostCollectionViewCell {

}
