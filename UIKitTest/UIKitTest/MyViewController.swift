//
//  MyViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/25.
//

import UIKit

class MyViewController:UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    let week = [
          "星期日","星期一","星期二","星期三",
          "星期四","星期五","星期六"]
    let meals = ["早餐","午餐","晚餐","宵夜"]
    var whatDay = "星期日"
    var whatMeal = "早餐"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { //返回UIPickerView当前的列数
        return 2
    }
    
    //每一列有多少行资料
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //设置第一列时
        if component == 0 {
            //第一列返回week元素的数量
            return week.count
        }
        //否则设置第二列
        //返回meals的数量
        return meals.count
        
    }
    
    //返回每个选项显示的资料
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //设置第一列时
        if component == 0{
            //week第row的资料
            return week[row]
        }
        //设置第二列
        //返回meals中的信息
        return meals[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //改变第一列时
        if component == 0{
            whatDay = week[row]
        }else{
            //改变第二列时
            whatMeal = meals[row]
        }
        //打印出来
        print("选择的是\(whatDay),选择\(whatMeal)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    }

}
