//
//  UIAplication+Extension.swift
//  AllAboutFood
//
//  Created by Apiux on 24-09-23.
//

import Foundation
import UIKit

extension UIApplication {
    var activeWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    public static func setRootView(_ viewController: UIViewController,
                                   options: UIView.AnimationOptions = .showHideTransitionViews,
                                   animated: Bool = true,
                                   duration: TimeInterval = 0.5,
                                   completion: (() -> Void)? = nil) {
        guard animated else {
            UIApplication.shared.activeWindow?.rootViewController = viewController
            return
        }

        UIView.transition(
            with: UIApplication.shared.activeWindow!,
            duration: duration,
            options: options,
            animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                UIApplication.shared.activeWindow?.rootViewController = viewController
                UIView.setAnimationsEnabled(oldState)
            },
            completion: { _ in
                completion?()
            }
        )
    }
}
