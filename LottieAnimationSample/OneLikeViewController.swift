//
//  OneLikeViewController.swift
//  LottieAnimationSample
//
//  Created by grkim on 2022/07/19.
//
// https://github.com/LottieFiles/app-tutorial-lottieinteractions

import UIKit
import Lottie

class OneLikeViewController: UIViewController {
    private lazy var animationView: AnimationView = {
        let animationView = AnimationView(animation: Animation.named(kLikeAnimationName)!)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = kLikeAnimationSpeed
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    var isLike: Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "One Like"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.animationView)
        NSLayoutConstraint.activate([
            self.animationView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            self.animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.animationView.widthAnchor.constraint(equalToConstant: 300),
            self.animationView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAnimation))
        self.animationView.addGestureRecognizer(tapGesture)
    }
    
    @objc func showAnimation() {
        self.isLike.toggle()
        
        if self.isLike {
            animationView.play(fromProgress: 0, toProgress: 0.5, loopMode: .playOnce)
        } else {
            animationView.play(fromProgress: 0.5, toProgress: 1, loopMode: .playOnce)
        }
    }
    
}
