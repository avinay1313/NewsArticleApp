//
//  ArticleListCell.swift
//  NewsArticleApp
//
//  Created by Admin on 15/08/23.
//

import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var ivArticleImg: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.viewContainer.layer.cornerRadius = 5
        self.viewContainer.clipsToBounds = true
        
//        self.ivArticleImg.layer.cornerRadius = 30
//        self.ivArticleImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(article: Article) {
        self.lblArticleTitle?.numberOfLines = 0
        self.lblArticleTitle?.text = article.title
        self.ivArticleImg?.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder"))
    }
    
    
}
