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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebview()
        setupLoadingView()
        loadWebview()
    }
    
    private func setupWebview() {
        webView = WKWebView(frame: self.view.frame)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view.addSubview(self.webView)
    }
    
    private func setupLoadingView() {
        loadingView = UIActivityIndicatorView(style: .large)
        loadingView.color = .black
        loadingView.center = view.center
        view.addSubview(loadingView)
        view.bringSubviewToFront(loadingView)
    }
    
    private func loadWebview() {
        let url = URL(string: articles?.url ?? "")!
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }
    
    private func manageLoadinView(status: Bool) {
        if status {
            loadingView.startAnimating()
            loadingView.isHidden = false
        } else {
            loadingView.stopAnimating()
            loadingView.isHidden = true
        }
    }
}

extension ArticleDetailsVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.manageLoadinView(status: true)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        self.manageLoadinView(status: false)
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.manageLoadinView(status: false)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.manageLoadinView(status: false)
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
