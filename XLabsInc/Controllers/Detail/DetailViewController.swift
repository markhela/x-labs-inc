//
//  DetailViewController.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 19.01.24.
//

import UIKit
import SnapKit
import SDWebImage

class DetailViewController: BaseViewController<DetailViewModelProtocol, DetailViewModel> {

    // MARK: - Subviews
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        return scrollView
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.medium
        return imageView
    }()

    // MARK: - Setup
    override func setupUI() {
        navigationItem.title = "Detail"
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.greaterThanOrEqualTo(16)
            make.trailing.lessThanOrEqualTo(-16)
            make.bottom.lessThanOrEqualTo(-16)
            make.width.equalTo(scrollView.snp.height)
            make.width.equalToSuperview().priority(.low)
            make.height.equalToSuperview().priority(.low)
            make.centerX.equalToSuperview()
        }

        scrollView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }

    override func configureBindings(with viewModel: DetailViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {
            case .setTitle(let title):
                self.titleLabel.text = title
            case .setImageURL(let url):
                self.imageView.sd_setImage(with: URL(string: url))
            }
        }
    }
}

// MARK: - private functions
private extension DetailViewController {

}

extension DetailViewController: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
