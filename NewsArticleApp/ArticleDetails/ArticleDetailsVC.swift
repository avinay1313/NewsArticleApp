//
//  ArticleDetailsVC.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import UIKit
import WebKit


class ArticleDetailsVC: UIViewController {
    
    var webView: WKWebView!
    
    var loadingView: UIActivityIndicatorView!

    var articles: Article?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupLoadingView()
        
        let url = URL(string: articles?.url ?? "")!
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 50)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        
//        self.loadingView.startAnimating()
    }
    
    private func setupLoadingView() {
        loadingView = UIActivityIndicatorView(style: .large)
        loadingView.color = .black
        loadingView.center = view.center
        view.addSubview(loadingView)
        view.bringSubviewToFront(loadingView)
    }
    
    private func stopLoadingView() {
        self.loadingView.stopAnimating()
        self.loadingView.isHidden = true
    }
}

extension ArticleDetailsVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // show indicator
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        // dismiss indicator
        self.stopLoadingView()
        // if url is not valid {
        //    decisionHandler(.cancel)
        // }
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // dismiss indicator
        self.stopLoadingView()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
      // show error dialog
        self.stopLoadingView()
    }
}

extension ArticleDetailsVC: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
}
