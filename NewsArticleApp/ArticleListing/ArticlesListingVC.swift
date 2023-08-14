//
//  ArticlesListingVC.swift
//  NewsArticleApp
//
//  Created by Admin on 14/08/23.
//

import UIKit

class ArticlesListingVC: UIViewController {
    
    @IBOutlet weak var tblArticles: UITableView!
    
    let viewModel = ArticlesListViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Latest News"
        self.navigationController?.title = "Latest News"

        self.tblArticles.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.viewModel.getArticles { status in
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = article.title
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
