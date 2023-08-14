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

        self.tblArticles.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}


extension ArticlesListingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Message"
        return cell
    }
}
