//
//  DealListViewController.swift
//  study3
//
//  Created by 曾卫 on 2024/4/24.
//

import UIKit

class DealListViewController: BaseViewController ,CommonListDelegate{
    
    func didSelectItem<Item>(_ item: Item) {
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let productList = CommonList<Deal, DealListCell>(frame: .zero)
        productList.items = FakeData.createDeals()
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
