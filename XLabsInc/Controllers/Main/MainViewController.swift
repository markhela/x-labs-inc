//
//  MainViewController.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController<MainViewModelProtocol, MainViewModel> {
    // MARK: - Subviews
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(cells: [PostCollectionViewCell.self])
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Setup
    override func setupUI() {
        navigationItem.title = "Main"
        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func configureBindings(with viewModel: MainViewModel?) {
        guard let viewModel else { return }
        viewModel.bind(self) { [weak self] action in
            guard let self else { return }
            switch action {

            }
        }
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
}

// MARK: -
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier(), for: indexPath) as? PostCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
