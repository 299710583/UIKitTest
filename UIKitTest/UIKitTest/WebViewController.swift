//
//  WebViewController.swift
//  UIKitTest
//
//  Created by 曾卫 on 2024/4/27.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate, WKNavigationDelegate {
    
    var webView:WKWebView!
    var btnBack = UIBarButtonItem()
    var btnForward = UIBarButtonItem()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fullScreenSize = UIScreen.main.bounds.size
//        self.view.addSubview(webView)
        //加载页面
        let url = URL(string:"http://www.baidu.com")
        let myRequest = URLRequest(url: url!)
        webView.load(myRequest)
        webView.uiDelegate = self//ui代理
        webView.navigationDelegate = self//导航代理
        
        //
        //获取导航栏高度
        let navHeight = self.navigationController?.navigationBar.frame.height
        //获取状态栏高度
        let window = self.view.window
        let statusBarFrame = window?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        let statusHeight = statusBarFrame.height
        webView = WKWebView(frame: CGRect(x: 0, y: statusHeight + navHeight!, width: self.view.frame.width, height: self.view.frame.height))
        //前进后退
        setNavBar()

    }
    
   
    func setNavBar() {
        btnBack = UIBarButtonItem(title: "后退", style: .plain, target: self, action: #selector(toBack))
        btnForward = UIBarButtonItem(title: "前进", style: .plain, target: self, action: #selector(toForward))
        self.navigationItem.rightBarButtonItems = [btnForward]
        self.navigationItem.leftBarButtonItems = [btnBack]
    }
    
    @objc func toBack() {
//        print("后退")
        if self.webView.canGoBack {
            print("后退")
            self.webView.goBack()
        }
    }
    
    @objc func toForward() {
//        print("前进")
        if self.webView.canGoForward {
            print("前进")
            self.webView.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // 实现非安全链接的跳转。如果目标主视图不为空,则允许导航
        if !(navigationAction.targetFrame?.isMainFrame != nil) {
            self.webView.load(navigationAction.request)
        }
        return nil
    }
}
