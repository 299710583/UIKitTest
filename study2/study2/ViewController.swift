//
//  ViewController.swift
//  study2
//
//  Created by 曾卫 on 2024/4/22.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://www.baidu.com").response{ response in
            debugPrint(response)
        }
    }


}

