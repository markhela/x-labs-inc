//
//  UIViewController+Ext.swift
//  XLabsInc
//
//  Created by Artsem Markhel on 17.01.24.
//

import UIKit

extension UIViewController {

    class func topMostController() -> UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let keyWindow = windowScene?.windows.filter {$0.isKeyWindow}.first
        return keyWindow?.rootViewController?.topMostViewController()
    }

    func topMostViewController() -> UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.topMostViewController()
        } else if let tabBarController = self as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return selectedViewController.topMostViewController()
            }
            return tabBarController.topMostViewController()
        } else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        } else {
            return self
        }
    }
}
