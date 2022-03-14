//
//  NewsFeedTableViewCell.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import UIKit
import Kingfisher

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imgvNewsThumbnail: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDescription: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(newsArticle : Article) {
        
        lblNewsTitle.text = newsArticle.title
        lblNewsDescription.text = newsArticle.articleDescription
        
        if let date = newsArticle.publishedAt.date(format: DateFormatType.isoDateTimeSec.stringFormat) {
            lblDate.text = date.toString(format: DateFormatType.altRSS)
        } else {
            lblDate.text = ""
        }
        
        if let imageURL = newsArticle.urlToImage {
            let url = URL(string: imageURL)
            imgvNewsThumbnail.kf.setImage(with: url)
        } else {
            imgvNewsThumbnail.image = UIImage(named: "placeholder")
        }
    }
    
}
