//
//  ViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/24.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("来到了viewcontroller")
        self.view.backgroundColor = UIColor.white
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "首页"
        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
        self.addChild(navigationHomeVC)
        print("结束")
    }
    
}
