//
//  SearchViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/28.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText =
                searchController.searchBar.text else {
            return
        }
        
        // 使用陣列的 filter() 方法篩選資料
        self.searchArr = self.cities.filter(
            { (city) -> Bool in
                // 將文字轉成 NSString 型別
                let cityText:NSString = city as NSString
                
                // 比對這筆資訊有沒有包含要搜尋的文字
                return (cityText.range(
                    of: searchText, options:
                        NSString.CompareOptions.caseInsensitive).location) != NSNotFound
            })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.searchController.isActive) {
                    return self.searchArr.count
                } else {
                    return self.cities.count
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(
            withIdentifier: "Cell", for: indexPath)

        if (self.searchController.isActive) {
                    cell.textLabel?.text =
                      self.searchArr[indexPath.row]
                    return cell
                } else {
                    cell.textLabel?.text =
                      self.cities[indexPath.row]
                    return cell
                }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(
            at: indexPath, animated: true)
        if (self.searchController.isActive) {
                    print(
                    "你选择的是 \(self.searchArr[indexPath.row])")
                } else {
                    print(
                    "你选择的是 \(self.cities[indexPath.row])")
                }
    }
    

    var tableView: UITableView!
    var searchController: UISearchController!
    let cities = ["武汉","北京","成都","重庆","广州","深圳","西安"]
    
    var searchArr : [String] = [String](){
        didSet {
            // 重设值
            self.tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let fullScreenSize = UIScreen.main.bounds.size
        
        //建立UItableView
        self.tableView = UITableView(frame: CGRect(
          x: 0, y: 20,
          width: fullScreenSize.width,
          height: fullScreenSize.height - 20),
          style: .plain)
        self.tableView.register(UITableViewCell.self,
          forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        //建立searchController
        self.searchController =
          UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController
          .hidesNavigationBarDuringPresentation = false
        //搜索框模式
        self.searchController.searchBar.searchBarStyle =
          .prominent
        
        self.searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView =
          self.searchController.searchBar
        
        
    }
    

}
