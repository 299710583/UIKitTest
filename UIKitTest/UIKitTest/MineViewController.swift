//
//  MineViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/26.
//

import UIKit



class MineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //每一组有多少个cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    //每个cell要实现的方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        //设置按钮样式
        if indexPath.section == 1 {
                if indexPath.row == 0 {
                    cell.accessoryType = .checkmark
                } else if indexPath.row == 1 {
                    cell.accessoryType = .detailButton
                } else if indexPath.row == 2 {
                    cell.accessoryType =
                        .detailDisclosureButton
                } else if indexPath.row == 3 {
                    cell.accessoryType = .disclosureIndicator
                }
            }
        
        //显示的内容
        if let myLabel = cell.textLabel {
                myLabel.text =
                  "\(info[indexPath.section][indexPath.row])"
            }
        
        return cell
    }
    
    
    var imageView :UIImageView!
    var mySlider :UISlider!
    var myLabel :UILabel!
    var myStepper :UIStepper!
    
    //用于tableView
    var info = [
        ["张三","李四","rr"],
        ["王五","赵四","li","aa"]
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //滑杆UISlider
        //UISlider 常用在控制音量或影片播放进度。
        let fullScreenSize = UIScreen.main.bounds.size
        
        imageView = UIImageView(image: UIImage(named: "J-20"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        self.view.addSubview(imageView)
        
        //建立滑杆
        mySlider=UISlider(frame: CGRect(
          x: 0, y: 0, width:
          fullScreenSize.width * 0.9, height: 50))
        
        mySlider.backgroundColor = UIColor.lightGray
        //滑杆右边还没到的颜色
        mySlider.maximumTrackTintColor = UIColor.orange
        //滑杆左边的颜色
        mySlider.minimumTrackTintColor = UIColor.purple
        //按钮的颜色
        mySlider.thumbTintColor = UIColor.brown
        //滑杆的最小值
        mySlider.minimumValue = 0
        //滑杆的最大值
        mySlider.maximumValue = 100
        //预设值
        mySlider.value = 50
        //滑杆同步执行，如果未false的话就是滑完之后才变
        mySlider.isContinuous = true
        //滑动的时候执行的动作
        mySlider.addTarget(
          self,
          action:
            #selector(onSliderChange),
          for: UIControl.Event.valueChanged)
        
        mySlider.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.65)
        self.view.addSubview(mySlider)
        
        //TableView
        //建立TableView
        let myTableView = UITableView(frame: CGRect(
          x: 0, y: 20,
          width: fullScreenSize.width,
          height: fullScreenSize.height/4),
          style: .grouped)
        
        myTableView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.75)
        
        //注册cell
        myTableView.register(
          UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //设置委任对象
        myTableView.delegate = self
        myTableView.dataSource = self
        //分割线样式
        myTableView.separatorStyle = .singleLine
        //分割线上下左右间距
        myTableView.separatorInset =
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        //是否可以点选cell
        myTableView.allowsSelection = true
        //是否可以多选cell
        myTableView.allowsMultipleSelection = false
        //加入到画面中
        self.view.addSubview(myTableView)
        
           

    }
    
    //点选cell的动作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 取消 cell 的选取状态
        tableView.deselectRow(
            at: indexPath as IndexPath, animated: true)

        let name = info[indexPath.section][indexPath.row]
        print("选择的是 \(name)")
    }
    
    //点选accessory
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let name = info[indexPath.section][indexPath.row]
            print("按下的是 \(name) 的 detail")
    }
    //有几组section
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    //每个section的标题
    func tableView(_ tableView: UITableView,
      titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "篮球" : "棒球"
        return title
    }
    
    @objc func onSliderChange() {
        // 设置透明度
        imageView.alpha = CGFloat(
          mySlider.value / mySlider.maximumValue)
    }
    
}
