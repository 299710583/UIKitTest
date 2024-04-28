//
//  HomeViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var myTextView:UITextView!
    
    var myDatePicker:UIDatePicker!
    var myLabelTime:UILabel!
    
    @objc func didClickButton(){
        if self.view.backgroundColor!.isEqual(UIColor.black) {
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.black
        }
    }
    
    @objc func simpleAlert(){
        //建立一个提示框
        let alertController = UIAlertController(title: "提示", message: "你确定要这么做", preferredStyle: .alert)
        //确认按钮
        let okAction = UIAlertAction(
                title: "确认",
                style: .default,
                handler: {
                (action: UIAlertAction!) -> Void in
                  print("按下确认")
            })
        alertController.addAction(okAction)
        
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func selectAlert(){
        print("按下送出键")
        let alertController = UIAlertController(
                title: "送出",
                message: "确定要送出？",
                preferredStyle: .alert)
        //选择按钮
        let cancelAction = UIAlertAction(
              title: "取消",
              style: .cancel,
              handler: nil)
            alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(
              title: "送出",
              style: .destructive,
              handler: nil)
            alertController.addAction(okAction)
        
        //显示提示框
        self.present(
              alertController,
              animated: true,
              completion: nil)
        
    }
    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        // 设置要的改进的内容
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"

        // 更新 UILabel 的内容
        myLabelTime.text = formatter.string(from: datePicker.date)
        
    }
    
    
    
    override func viewDidLoad() {
        print("hahha")
        self.view.backgroundColor = UIColor.white
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.view.addSubview(firstView)
        let fullScreenSize = UIScreen.main.bounds.size
        firstView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height*0.5)
        firstView.backgroundColor = UIColor.blue
        
        //建立一个UILabel
         let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        //标签文字
        myLabel.text = "这是一个标签"
        //标签文字颜色
        myLabel.textColor = UIColor.black
        //字体
        myLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        //字体位置
        myLabel.textAlignment = NSTextAlignment.center
        //文字行数
        myLabel.numberOfLines = 1
        myLabel.backgroundColor = UIColor.white
        myLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height*0.1)
        self.view.addSubview(myLabel)
        
        //建立一个UITextfiled
        let myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        //还没有输入的时候预设提示的文字
        myTextField.placeholder = "请输入文字"
        //圆角
        myTextField.borderStyle = .roundedRect
        //输入文字颜色
        myTextField.textColor = UIColor.darkGray
        //输入框背景颜色
        myTextField.backgroundColor = UIColor.white
        myTextField.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height*0.1)
        self.view.addSubview(myTextField)
        
        //建立一个UITextView
        myTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        myTextView.backgroundColor = UIColor.black
        myTextView.textColor = UIColor.white
        //字体大小
        myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        //向左对齐
        myTextView.textAlignment = .left
        //预设内容
        myTextView.text = "你想说什么"
        //文字是否可编辑
        myTextView.isEditable = true
        
        myTextView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height*0.2)
        self.view.addSubview(myTextView)
        
        //按钮UIButton
        //预设的按钮样式
//        let myButton = UIButton(type: .contactAdd)
//        myButton.backgroundColor = UIColor.systemPink
//        myButton.center = CGPoint( x: fullScreenSize.width * 0.5,
//                                   y: fullScreenSize.height * 0.3)
//        self.view.addSubview(myButton)
        //建立自定义的按钮
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        //设置文字颜色
        myButton.setTitle("点一下", for: .normal)
        //按钮文字颜色
        myButton.setTitleColor(UIColor.orange, for: .normal)
        //设置按钮是否可用
        myButton.isEnabled = true
        //按钮背景颜色
        myButton.backgroundColor = UIColor.black
        //设置按钮的动作
        
        myButton.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        myButton.center = CGPoint( x: fullScreenSize.width * 0.5,
                                   y: fullScreenSize.height * 0.3)
        self.view.addSubview(myButton)
        
        //UIAlertController,提示框
        
        let button1 = UIButton(type: .system)
        button1.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        button1.setTitle("提示", for: .normal)
        
        button1.backgroundColor = UIColor.init(
          red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        button1.center = CGPoint(x: fullScreenSize.width * 0.5, y: 300)
        button1.addTarget(nil, action: #selector(simpleAlert), for: .touchUpInside)
        
        self.view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.frame  = CGRect(x: 0, y: 0, width: 100, height: 20)
        button2.setTitle("送出", for: .normal)
        button2.backgroundColor = UIColor.init(
            red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        button2.center = CGPoint(x: fullScreenSize.width * 0.5, y: 350)
        button2.addTarget(nil, action: #selector(selectAlert), for: .touchUpInside)
        self.view.addSubview(button2)
        
        //UIImagineView
        let myImageView = UIImageView(
          frame: CGRect(
            x: 0, y: 0, width: 100, height: 100))
        myImageView.image = UIImage(named: "j20.jpg")
        
        myDatePicker = UIDatePicker(frame: CGRect(
          x: 0, y: 0,
          width: fullScreenSize.width, height: 100))
        
        //设置date格式
        myDatePicker.datePickerMode = .dateAndTime
        //设置时间间隔
        myDatePicker.minuteInterval = 15
        //设置预设时间为现在
        myDatePicker.date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        //可以选择的格式最早时间
        let fromDateTime = formatter.date(from: "2016-01-02 18:08")
        myDatePicker.minimumDate = fromDateTime
        //可以选择的最晚时间
        let endDateTime = formatter.date(from: "2024-12-31 18:08")
        myDatePicker.maximumDate = endDateTime
        //设置显示时间语言环境
        myDatePicker.locale = Locale(identifier: "zh_CN")
        //设置改变日期时间时执行的动作的方法
        myDatePicker.addTarget(self,
            action:
              #selector(datePickerChanged),
            for: .valueChanged)
        
        //label用来显示时间
        myLabelTime = UILabel(frame: CGRect(
          x: 0, y: 0,
          width: fullScreenSize.width, height: 50))
        myLabelTime.backgroundColor = UIColor.lightGray
        myLabelTime.textAlignment = .center
        myLabelTime.textColor = UIColor.black
        myLabelTime.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.15)
        self.view.addSubview(myLabelTime)
        
        myDatePicker.center = CGPoint(
          x: fullScreenSize.width * 0.2,
          y: fullScreenSize.height * 0.7)
        self.view.addSubview(myDatePicker)
        
        let button3 = UIButton(type: .custom)
        button3.setTitle("跳转1", for: .normal)
        button3.backgroundColor = UIColor.orange
        button3.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        button3.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize
            .height * 0.8)
        button3.addTarget(self, action: #selector(didClickLogin), for: .touchUpInside)
        self.view.addSubview(button3)
        
        
        let button4 = UIButton(type: .custom)
        button4.setTitle("跳转2", for: .normal)
        button4.backgroundColor = UIColor.orange
        button4.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        button4.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize
            .height * 0.9)
        button4.addTarget(self, action: #selector(didClickMine), for: .touchUpInside)
        self.view.addSubview(button4)
        let button5 = UIButton(type: .custom)
        button5.setTitle("跳转3", for: .normal)
        button5.backgroundColor = UIColor.orange
        button5.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        button5.center = CGPoint(x: fullScreenSize.width * 0.15, y: fullScreenSize
            .height * 0.9)
        button5.addTarget(self, action: #selector(didCilickWeb), for: .touchUpInside)
        self.view.addSubview(button5)
        
        let button6 = UIButton(type: .custom)
        button6.setTitle("跳转4", for: .normal)
        button6.backgroundColor = UIColor.orange
        button6.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        button6.center = CGPoint(x: fullScreenSize.width * 0.8, y: fullScreenSize
            .height * 0.8)
        button6.addTarget(self, action: #selector(didCilickCollection), for: .touchUpInside)
        self.view.addSubview(button6)
        
        let button7 = UIButton(type: .custom)
        button7.setTitle("跳转5", for: .normal)
        button7.backgroundColor = UIColor.orange
        button7.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        button7.center = CGPoint(x: fullScreenSize.width * 0.8, y: fullScreenSize
            .height * 0.9)
        button7.addTarget(self, action: #selector(didCilickSearch), for: .touchUpInside)
        self.view.addSubview(button7)
        
        let button8 = UIButton(type: .custom)
        button8.setTitle("跳转6", for: .normal)
        button8.backgroundColor = UIColor.orange
        button8.frame = CGRect(x: 0, y: 0, width: 100 , height: 50)
        button8.center = CGPoint(x: fullScreenSize.width * 0.15, y: fullScreenSize
            .height * 0.8)
        button8.addTarget(self, action: #selector(didCilickGesture), for: .touchUpInside)
        self.view.addSubview(button8)
        
    }
    
    @objc func didCilickGesture(){
        let gestureVC = GestureViewController()
        navigationController?.pushViewController(gestureVC, animated: true)
    }
    
    @objc func didCilickSearch(){
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    @objc func didCilickCollection(){
        let collectionVC = CollectionViewController()
        navigationController?.pushViewController(collectionVC, animated: true)
    }
    
    
    
    @objc func didCilickWeb(){
        let webVC = WebViewController()
        navigationController?.pushViewController(webVC, animated: true)
    }
    
    @objc func didClickLogin(){
//        print("跳转")
        let loginVC = LoginViewController()
//        self.present(loginVC, animated: true, completion: nil)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    @objc func didClickMine(){
        let otherVC = MineViewController()
        navigationController?.pushViewController(otherVC, animated: true)
    }

   
}
