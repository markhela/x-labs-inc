//
//  UICollectionView+Register.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

extension UICollectionView {
    func register(cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            register(cell.self, forCellWithReuseIdentifier: cell.reuseIdentifier())
        }
    }

    func register(supplementaryViews: [UICollectionReusableView.Type]) {
        for view in supplementaryViews {
            register(view.self,
                     forSupplementaryViewOfKind: view.kind,
                     withReuseIdentifier: view.reuseIdentifier())
        }
    }

    func register(headers: [UICollectionReusableView.Type]) {
        for header in headers {
            register(header.self,
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                     withReuseIdentifier: header.reuseIdentifier())
        }
    }

    func register(footers: [UICollectionReusableView.Type]) {
        for footer in footers {
            register(footer.self,
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                     withReuseIdentifier: footer.reuseIdentifier())
        }
    }
}
