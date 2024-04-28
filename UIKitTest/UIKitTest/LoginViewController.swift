//
//  LoginViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/25.
//

import UIKit

class LoginViewController: UIViewController {
    
//
    var myProgressView:UIProgressView!
    var myActivityIndicator:UIActivityIndicatorView!
    var myTimer:Timer!
    var myButton:UIButton!
    var count = 0
    let complete = 100

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.view.addSubview(firstView)
        let fullScreenSize = UIScreen.main.bounds.size
        firstView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height*0.5)
        firstView.backgroundColor = UIColor.blue
        
        //选择器UIPickerView，要建立一个UIPickerView之后在上面加.addChild,选择器要执行的操作用myViewController来加上
        
        let myPickerView = UIPickerView(frame: CGRect(
            x: 0, y: fullScreenSize.height * 0.3,
            width: fullScreenSize.width, height: 150))
        
        let myViewController = MyViewController()
        self.addChild(myViewController)
        
        myPickerView.delegate = myViewController
        myPickerView.dataSource = myViewController 
        
        self.view.addSubview(myPickerView)
        
        //开关UISwitch
        //建立按钮
        var mySwitch = UISwitch()
        mySwitch.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.2)
        
        self.view.addSubview(mySwitch)
        
        //建立另一个按钮
        mySwitch = UISwitch()
        //设置滑杆按钮的颜色
        mySwitch.thumbTintColor = UIColor.orange
        //设置未选取时的颜色
        mySwitch.tintColor = UIColor.black
        //设置选取时的颜色
//        mySwitch.onTintColor = UIColor.black
        mySwitch.addTarget(
          self,
          action:
            #selector(onChange),
          for: .valueChanged)
        
        mySwitch.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.35)
        self.view.addSubview(mySwitch)
        
        //分段控制器
        let mySegmentedControl = UISegmentedControl(
          items: ["早餐","午餐","晚餐","宵夜"])
        
        //设置外观颜色
        mySegmentedControl.tintColor = UIColor.blue
        //设置底色
        mySegmentedControl.backgroundColor = UIColor.lightGray
        //设置预设选项
        mySegmentedControl.selectedSegmentIndex = 0
        
        //设置切换时的动作
        
        mySegmentedControl.addTarget(
          self,
          action:
            #selector(onChange1),
          for: .valueChanged)
        
        //设置尺寸加入画面中
        
        mySegmentedControl.frame.size = CGSize(
          width: fullScreenSize.width * 0.9, height: 30)
        mySegmentedControl.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.15)
        self.view.addSubview(mySegmentedControl)
        
        //进度条
        //建立一个长进度条
        myProgressView = UIProgressView(progressViewStyle : .default)
        //长进度条的yanse
        myProgressView.progressTintColor=UIColor.blue
        //长进度条未填满时的底色是
        myProgressView.trackTintColor=UIColor.orange
        //放入其中
        myProgressView.frame=CGRectMake(
          0,0,fullScreenSize.width * 0.8,50)
        myProgressView.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.6)
        self.view.addSubview(myProgressView)
        
        //建立环状进度条
        myActivityIndicator = UIActivityIndicatorView(style:UIActivityIndicatorView.Style.large)
        //环状进度条的颜色
        myActivityIndicator.color = UIColor.black
        //环状进度条的底色
        myActivityIndicator.backgroundColor = UIColor.gray
        
        //加入画面中
        myActivityIndicator.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.65)
        self.view.addSubview(myActivityIndicator);
        
        //模拟进度
        //建立一个模拟进度的button
        myButton = UIButton(frame: CGRect(
          x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Reset", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
          nil,
          action:
            #selector(clickButton),
          for: .touchUpInside)
        myButton.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.7)
        self.view.addSubview(myButton)
        
        //执行一次进度条的动作
        
        
        
        
    }
    
    @objc func clickButton(){
        //进度推进时，按钮是无法用的
        myButton.isEnabled = false
        print("开始计时")
        
        //分别重设两个进度条
        myProgressView.progress = 0
        myActivityIndicator.startAnimating()
        
        //
        myTimer = Timer.scheduledTimer(
            timeInterval: 0.2,
                target: self,
                selector:#selector(showProgress),
                userInfo: ["test":"for userInfo test"],
                repeats: true)
        
        print("计时结束")
        
    }
    @objc func showProgress(sender: Timer){
       
        // 计数器
        count += 5
        
        // 每次修改进度
        myProgressView.progress = Float(count) / Float(complete)
        
        // 进度完成
        if count >= complete {
            // 示例传入参数
            let info =
            sender.userInfo as?
            Dictionary<String, AnyObject>
            print(info?["test"] ?? "")
            
            // 重置计数器以便下次按住
            count = 0
            myTimer?.invalidate()
            myTimer = nil
            
            // 隐藏进度条
            myActivityIndicator.stopAnimating()
            
            // 按钮功能开
            myButton.isEnabled = true
        }
    }
    
    @objc func onChange1(sender: UISegmentedControl){
        print(sender.selectedSegmentIndex)
        print(
            sender.titleForSegment(
                at: sender.selectedSegmentIndex) ?? 0)
        
    }
    
    @objc func onChange(sender:AnyObject){
        //获取元件
        let tempSwitch = sender as! UISwitch
        
        if tempSwitch.isOn {
                self.view.backgroundColor = UIColor.black
            } else {
                self.view.backgroundColor = UIColor.white
            }
    }
}
