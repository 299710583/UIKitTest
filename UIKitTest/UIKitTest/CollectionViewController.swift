//
//  CollectionViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/28.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    var fullScreenSize:CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreenSize = UIScreen.main.bounds.size
        self.view.backgroundColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        //设置section间距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        //设置一个每一行的间距
        layout.minimumLineSpacing = 5
        //设置cell大小
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width/2 - 10), height: fullScreenSize.height / 3 - 80)
        //设置header和footer的大小
        layout.headerReferenceSize = CGSize(
            width: fullScreenSize.width, height: 40)
        layout.footerReferenceSize = CGSize(
            width: fullScreenSize.width, height: 40)
        
        //建立CollectionView
        let myCollectionView = UICollectionView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height - 20),
            collectionViewLayout: layout)
        
//        myCollectionView.backgroundColor = UIColor.blue
        //注册cell以供重复使用
        myCollectionView.register( MyCollectionViewCell.self,
                                   forCellWithReuseIdentifier: "Cell")
        myCollectionView.delegate = self
        myCollectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind:
                UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header")
        myCollectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind:
                UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "Footer")
        
        //设置委任对象
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
    }
    
    
    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as!MyCollectionViewCell
        
        cell.imageView.image =
        UIImage(named: "0\(indexPath.item + 1).jpg")
        cell.titleLabel.text = "0\(indexPath.item + 1)"
        
        return cell
    }
    
    //有几个section
    
    func numberOfSectionsInCollectionView(
        collectionView: UICollectionView) -> Int {
            return 2
        }
    
    //    点选cell执行的动作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你选择第 \(indexPath.section + 1)组的")
        print("第 \(indexPath.item + 1) 张图片")
    }
    
    //fsdfdfsdfsdf
    
    
    //设置footer和header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()
        
        // 显示文字
        let label = UILabel(frame: CGRect(
            x: 0, y: 0,
            width: fullScreenSize.width, height: 40))
        label.textAlignment = .center
        
        // header
        if kind == UICollectionView.elementKindSectionHeader {
            reusableView =
            collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "Header",
                for: indexPath)
    
            reusableView.backgroundColor =
            UIColor.darkGray
            label.text = "Header";
            label.textColor = UIColor.white
            
        } else if kind ==
                    UICollectionView.elementKindSectionFooter {
    
            reusableView =
            collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: "Footer",
                for: indexPath)

            reusableView.backgroundColor =
            UIColor.cyan
            label.text = "Footer";
            label.textColor = UIColor.black
            
        }
        
        reusableView.addSubview(label)
        return reusableView
    }
}
