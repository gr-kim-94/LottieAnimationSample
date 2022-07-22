//
//  UpCurvedLikeViewController.swift
//  LottieAnimationSample
//
//  Created by grkim on 2022/07/21.
//

import UIKit
import Lottie

class UpCurvedLikeViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Up Curved Like"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAnimation))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func showAnimation() {
        (0...10).forEach { _ in
            generateAnimatedViews()
        }
    }
    
    func generateAnimatedViews() {
        let animationView = AnimationView(animation: Animation.named(kLikeAnimationName)!)
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = kLikeAnimationSpeed
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        let dimension = 30 + drand48() * 10
        animationView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        animationView.alpha = drand48()
        
        animationView.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        animationView.layer.add(animation, forKey: nil)
        
        self.view.addSubview(animationView)
    }
    
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        let randomX: CGFloat = CGFloat(arc4random_uniform(UInt32(self.view.frame.size.width)))
        
        let startPoint = CGPoint(x: randomX, y: self.view.frame.size.height)
        let endPoint = CGPoint(x: randomX, y: 0)
        
        path.move(to: startPoint)
        
        let randomXShift = randomX + drand48() * 300
        let cp1 = CGPoint(x: randomX - randomXShift, y: self.view.frame.size.height / 3)
        let cp2 = CGPoint(x: randomX + randomXShift, y: (self.view.frame.size.height * 2) / 3)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        
        path.addLine(to: endPoint)
        
        return path
    }
}

