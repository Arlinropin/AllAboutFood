//
//  UIImageView+Extension.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(
        url: URL,
        placeholder: UIImage? = nil,
        _ onCompletion: ((UIImage?, Bool) -> Void)? = nil
    ) {
        let options: KingfisherOptionsInfo = [
            .backgroundDecode,
            .downloadPriority(.zero),
            .cacheMemoryOnly
        ]
        kf.setImage(
            with: url,
            placeholder: placeholder,
            options: options
        ) { result in
            do {
                let image = try result.get().image
                onCompletion?(image, true)
            } catch {
                onCompletion?(nil, false)
            }
        }
    }
}
