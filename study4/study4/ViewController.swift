//
//  ViewController.swift
//  study4
//
//  Created by 曾卫 on 2024/4/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.setTitle("Go to Login", for: .normal)
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        self.view.addSubview(button)
    }

    @objc func goToLogin() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}


