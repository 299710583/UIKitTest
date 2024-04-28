//
//  GestureViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/28.
//

import UIKit

class GestureViewController: UIViewController {
    
    
    var fullSize :CGSize!
    var myUIView :UIView!
    var anotherUIView :UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullSize = self.view.bounds.size
        
        let doubleFingers = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        
        //点几下才能出发，1则为一下，以此类推
        doubleFingers.numberOfTapsRequired = 1
        //几根手指出发
        doubleFingers.numberOfTouchesRequired = 2
        
        //加入手势监听
        self.view.addGestureRecognizer(doubleFingers)
        
//        单指轻点
        let singleFinger = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        
        //要点两下
        singleFinger.numberOfTapsRequired = 2
        singleFinger.numberOfTouchesRequired = 1
        
        singleFinger.require(toFail: doubleFingers)
        
        //为试图加入见tint收拾
        self.view.addGestureRecognizer(singleFinger)
        
        //长按longTap
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        self.view.addGestureRecognizer(longPress)
        
        //滑动
        //一个可以移动的区域
        myUIView = UIView(frame: CGRect(
            x: 0, y: 200, width: 100, height: 100))
        myUIView.backgroundColor = .blue
        self.view.addSubview(myUIView)
        
        //向上滑动
        let swipeUp = UISwipeGestureRecognizer(
          target:self,
          action:#selector(swipe))
        swipeUp.direction = .up
        
        swipeUp.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(swipeUp)
        
        //向左滑动
        let swipeLeft = UISwipeGestureRecognizer(
          target:self,
          action:#selector(swipe))
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeLeft)
        
        //向下滑动
        let swipeDown = UISwipeGestureRecognizer(
          target:self,
          action:#selector(swipe))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        //向右滑动
        let swipeRight = UISwipeGestureRecognizer(
          target:self,
          action:#selector(swipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        //拖拽pan
        //可供移动的view
        anotherUIView = UIView(frame: CGRect(
          x: fullSize.width * 0.5, y: fullSize.height * 0.5,
          width: 100, height: 100))
        anotherUIView.backgroundColor = .orange
        self.view.addSubview(anotherUIView)
        
        //拖曳手势
        let pan = UIPanGestureRecognizer(
          target:self,
          action:#selector(pan))
        
        //最少可以用几根指
        pan.minimumNumberOfTouches = 1
        //最多可以用
        pan.maximumNumberOfTouches = 1
        anotherUIView.addGestureRecognizer(pan)
        
        

        
        
        
        
        
        
    }
    
    //单指按下的动作
    @objc func singleTap(recognizer:UITapGestureRecognizer){
        print("单指按下")
        self.findFingerPosition(recognizer: recognizer)
    }
    //双指按下
    @objc func doubleTap(recognizer:UITapGestureRecognizer){
        print("双指按下")
        self.findFingerPosition(recognizer: recognizer)
    }
    
    func findFingerPosition(recognizer:UIGestureRecognizer){
        let number = recognizer.numberOfTouches
            for i in 0..<number {
                let point = recognizer.location(
                    ofTouch: i, in: recognizer.view)
                print(
                    "第 \(i + 1) 指的位置：\(NSCoder.string(for: point))")
            }
    }
    
    
    @objc func longPress(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            print("长按开始")
        } else if recognizer.state == .ended {
            print("长按结束")
        }

    }
    
    @objc func swipe(recognizer:UISwipeGestureRecognizer) {
        let point = myUIView.center

        if recognizer.direction == .up {
            print("Go Up")
            if point.y >= 150 {
                myUIView.center = CGPoint(
                  x: myUIView.center.x,
                  y: myUIView.center.y - 100)
            } else {
                myUIView.center = CGPoint(
                  x: myUIView.center.x, y: 50)
            }
        } else if recognizer.direction == .left {
            print("Go Left")
            if point.x >= 150 {
                myUIView.center = CGPoint(
                  x: myUIView.center.x - 100,
                  y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(
                  x: 50, y: myUIView.center.y)
            }
        } else if recognizer.direction == .down {
            print("Go Down")
            if point.y <= fullSize.height - 150 {
                myUIView.center = CGPoint(
                  x: myUIView.center.x,
                  y: myUIView.center.y + 100)
            } else {
                myUIView.center = CGPoint(
                  x: myUIView.center.x,
                  y: fullSize.height - 50)
            }
        } else if recognizer.direction == .right {
            print("Go Right")
            if point.x <= fullSize.width - 150 {
                myUIView.center = CGPoint(
                  x: myUIView.center.x + 100,
                  y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(
                  x: fullSize.width - 50,
                  y: myUIView.center.y)
            }
        }
    }
    //拖拽手势后动作
    @objc func pan(recognizer:UIPanGestureRecognizer) {
        // 设置UIView 新的位置
        let point = recognizer.location(in: self.view)
        anotherUIView.center = point
    }
}

