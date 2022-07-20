//
//  CurvedLikeViewController.swift
//  LottieAnimationSample
//
//  Created by grkim on 2022/07/19.
//
// https://www.youtube.com/watch?v=-DGnHfUDMgg

import UIKit
import Lottie

class CurvedLikeViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Curved Like"
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
        
        let dimension = 20 + drand48() * 10
        animationView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        animationView.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        animationView.layer.add(animation, forKey: nil)
        
        view.addSubview(animationView)
    }
    
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        let defaultY: CGFloat = 200
        let startPoint = CGPoint(x: 0, y: defaultY)
        let endPoint = CGPoint(x: 400, y: defaultY)
        
        path.move(to: startPoint)
        
        // drand48() 0부터 1.0 사이의 난수를 리턴
        let randomYShift = defaultY + drand48() * 300
        let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
        let cp2 = CGPoint(x: 200, y: 300 + randomYShift)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        
        return path
    }
}
