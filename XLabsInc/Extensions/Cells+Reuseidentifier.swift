//
//  Cells+Reuseidentifier.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 18.01.24.
//

import UIKit

protocol ReuseIdentifiable {
    static func reuseIdentifier() -> String
}

extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

protocol KindIdentifiable {
    static var kind: String { get }
}

extension KindIdentifiable {
    static var kind: String {
        return String(describing: self) + "Kind"
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionReusableView: ReuseIdentifiable, KindIdentifiable {}
