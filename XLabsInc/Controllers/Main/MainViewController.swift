//
//  MainViewController.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController<MainViewModelProtocol, MainViewModel> {
    
    private var posts: [PostViewModelProtocol] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - Subviews
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(cells: [PostCollectionViewCell.self])
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    // MARK: - Setup
    override func setupUI() {
        navigationItem.title = "Main"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    override func configureBindings(with viewModel: MainViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {
            case .isLoading(let isLoading):
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            case .setPosts(let posts):
                self.posts = posts
            }
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.fetchPosts()
    }
}

// MARK: - private functions
private extension MainViewController {
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    @objc
    func addAction() {
        viewModel?.add()
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier(), for: indexPath) as? PostCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.viewModel = posts[indexPath.item]
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = posts[indexPath.item].post
        viewModel?.selectDetail(post: post)
    }
}
