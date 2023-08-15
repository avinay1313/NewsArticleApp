//
//  ArticlesListingVC.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import UIKit
import SDWebImage

class ArticlesListingVC: UIViewController {
    
    @IBOutlet weak var tblArticles: UITableView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    let viewModel = ArticlesListViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Latest News"
        self.navigationController?.title = "Latest News"

        self.tblArticles.register(UINib(nibName: "ArticleListCell", bundle: nil), forCellReuseIdentifier: "ArticleListCell")

        self.loadingView.startAnimating()
        self.viewModel.getArticles { status in
            self.loadingView.stopAnimating()
            self.loadingView.isHidden = true
            if status {
                self.tblArticles.reloadData()
            }
        }
    }

}


extension ArticlesListingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrArticles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let article = viewModel.arrArticles?[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListCell")! as! ArticleListCell
        cell.setupUI(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = viewModel.arrArticles?[indexPath.row] else {
            return
        }
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleDetailsVC") as? ArticleDetailsVC
        vc?.articles = article
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
