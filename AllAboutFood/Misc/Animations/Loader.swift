//
//  Loader.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import UIKit
import Lottie

final class Loader: UIView{
    // 1. Create the LottieAnimationView
    @IBOutlet weak var background: UIView!
    
    private var animationView: LottieAnimationView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        loadViewFromNib()
        animationView = .init(name: "loader")
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.frame = bounds
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1
        background.addSubview(animationView!)
        background.layer.cornerRadius = 20
        animationView?.topAnchor.constraint(equalTo: background.topAnchor).isActive = true
        animationView?.bottomAnchor.constraint(equalTo: background.bottomAnchor).isActive = true
        animationView?.leadingAnchor.constraint(equalTo: background.leadingAnchor).isActive = true
        animationView?.trailingAnchor.constraint(equalTo: background.trailingAnchor).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func play(on viewController: UIViewController) {
        guard let window = viewController.view,
              let animationView = animationView else { return }
        animationView.play()
        window.addSubview(self)
        topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
    }

    func stop(){
        guard let animationView = animationView else { return }
        // 6. Play animation
        animationView.stop()
        removeFromSuperview()
    }
}
