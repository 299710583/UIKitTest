//
//  MyCollectionViewCell.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/28.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let fullScreenSize = UIScreen.main.bounds.size
        let w = fullScreenSize.width
        //建立一个UIImageView
        imageView = UIImageView(frame: CGRect(
                  x: 0, y: 0,
                  width: w/2 - 10.0, height: w/2 - 10.0))
                self.addSubview(imageView)
        
        titleLabel = UILabel(frame:CGRect(
                  x: 0, y: 0, width: w/2 - 10.0, height: 40))
                titleLabel.textAlignment = .center
                titleLabel.textColor = UIColor.orange
        self.addSubview(titleLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
