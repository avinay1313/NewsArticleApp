//
//  ArticleDetailsVC.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import UIKit
import WebKit


class ArticleDetailsVC: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var articles: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        let url = URL(string: articles?.url ?? "")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

    }
    

    

}
