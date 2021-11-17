//
//  NewsCell.swift
//  NewsApp
//
//  Created by Sukru Kahraman on 17.11.2021.
//

import UIKit
import NewsAPI
import SDWebImage
import Utility

protocol NewsCellDelegate: AnyObject {
    func reloadList()
}

class NewsCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var delegate: NewsCellDelegate?
    var model: ArticleModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(article: ArticleModel) {
        model = article
        let readLists = ReadList.shared.readLists
        if let id = article.source?.id, let title = article.title {
            if (readLists.firstIndex(of: "\(id)-\(title)") != nil) {
                readButton.setTitle("remove_from_read_list".localized, for: .normal)
            } else {
                readButton.setTitle("add_to_read_list".localized, for: .normal)
            }
        }
        
        titleLabel.text = article.title
        
        if let urlString = article.urlToImage {
            imageView.sd_setImage(with: URL(string: urlString))
        }
        if let dateStr = article.publishedAt {
            let date = Date.date(from: dateStr, with: Date.dateFormat)
            dateLabel.text = date?.toStringWithOnlyTime()
        }
    }

    @IBAction func addToReadList(_ sender: UIButton) {
        ReadList.shared.addOrRemoveArticle(id: model.source?.id, title: model.title)
        delegate?.reloadList()
    }
}
