//
//  KWebViewController.swift
//  listen
//
//  Created by tw on 2018/7/17.
//  Copyright © 2018年 DMWL. All rights reserved.
//

import UIKit
import WebKit

class KWebViewController: kViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler {

        
    var webView:WKWebView?
    var url:URL? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true;
        
        let config = WKWebViewConfiguration()
        let userContent:WKUserContentController = WKUserContentController()
 
 
        config.userContentController = userContent;
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight),configuration:config)
        webView?.scrollView.isScrollEnabled = false
        webView?.scrollView.showsVerticalScrollIndicator = false
        webView?.scrollView.showsHorizontalScrollIndicator = false
        webView?.uiDelegate = self;
        webView?.navigationDelegate = self;
        self.view.addSubview(self.webView!)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if  (self.url == nil) {
            return
        }
        
        let request = URLRequest(url: self.url!)
        webView?.load(request)
        webView?.configuration.userContentController.add(self as WKScriptMessageHandler,name:"HandleJSEvent")
    }
    
    
    
    //MARK: - WKScriptMessageHandler
    
    //js调用swift
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //"NativeMethod"需要与userContent.add(self, name: "NativeMethod")中相同
      DLog(message)
    }
    
    
    //MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //页面开始加载时调用
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        //当内容开始返回时调用
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 页面加载完成之后调用
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // 页面加载完成之后调用
    }
    
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        //// 接收到服务器跳转请求之后调用
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
        
        let scheme = url?.scheme
        
        guard let schemeStr = scheme else { return
            
        }
        if schemeStr == "tel" {
            //iOS10 改为此函数
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url!, options: [String : Any](), completionHandler: nil)
            } else {
                // Fallback on earlier versions
            }
        }
        
        decisionHandler(.allow)
        // 在发送请求之前，决定是否跳转
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        
        decisionHandler(.allow)
        
        // 在收到响应后，决定是否跳转
    }
    
    
    //MARK: - WKUIDelegate
    // 创建一个新的WebView
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        return WKWebView()
    }
    
    // 输入框
    // JS端调用prompt函数时，会触发此方法
    // 要求输入一段文本
    // 在原生输入得到文本内容后，通过completionHandler回调给JS
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void){
        
        
        
    }
    
    
    // 确认框
    // JS端调用confirm函数时，会触发此方法
    // 通过message可以拿到JS端所传的数据
    // 在iOS端显示原生alert得到YES/NO后
    // 通过completionHandler回调给JS端
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void){
        
        
    }
    
    
    // 警告框
    // 在JS端调用alert函数时，会触发此代理方法。
    // JS端调用alert时所传的数据可以通过message拿到
    // 在原生得到结果后，需要回调JS，是通过completionHandler回调
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void){
        
        
    }
    
    
}
