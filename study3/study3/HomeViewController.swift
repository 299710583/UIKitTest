//
//  HomeViewController.swift
//  study3
//
//  Created by 曾卫 on 2024/4/23.
//

import UIKit
import Kingfisher
class HomeViewController: BaseViewController ,BannerViewDataSource,CommonListDelegate{
    func didSelectItem<Item>(_ item: Item) {
        if let product = item as? Product {
            let detailVC = DetailViewController()
            detailVC.product = product
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }
    
    func numberOfBanners(_ bannerView: BannerView) -> Int {
        return FakeData.createBanners().count
    }
    
    func viewForBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return view
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return imageView
        }
            
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollInterval = 2
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
        let produclist = CommonList<Product,ProductCell>(frame: .zero)
        produclist.items = FakeData.createProducts()
        produclist.delegate = self
        view.addSubview(produclist)
        produclist.snp.makeConstraints{ (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp.bottom).offset(5)
            
        }
        
    }
}
