//
//  MainViewController.swift
//  LottieAnimationSample
//
//  Created by grkim on 2022/07/19.
//

import UIKit

let kLikeAnimationName: String = "likeAnimation"
let kLikeAnimationSpeed: CGFloat = 2.0

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
        tabBar.barTintColor = .red
        tabBar.shadowImage = UIImage()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        viewControllers = [
            UINavigationController(rootViewController:  OneLikeViewController()),
            UINavigationController(rootViewController:  CurvedLikeViewController()),
            UINavigationController(rootViewController:  UpLikeViewController()),
            UINavigationController(rootViewController:  UpCurvedLikeViewController()),
        ]

    }
}
