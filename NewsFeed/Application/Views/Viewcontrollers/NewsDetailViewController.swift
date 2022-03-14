//
//  NewsDetailViewController.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var imgvNewsImage: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    private var viewModel: NewsFeedDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        loadData()
    }
    
    class func instantiateViewController(newsArticle : Article) -> NewsDetailViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        vc.viewModel = NewsFeedDetailViewModel(withNewsArticle: newsArticle)
        return vc
    }
    
    func setup() {
        setNavigationBarTitle(title: "News Detail")
    }
    
    func loadData() {
     
        lblNewsTitle.text = viewModel.newsArticle.title
        lblNewsDescription.text = viewModel.newsArticle.articleDescription
        
        if let date = viewModel.newsArticle.publishedAt.date(format: DateFormatType.isoDateTimeSec.stringFormat) {
            lblDate.text = date.toString(format: DateFormatType.altRSS)
        } else {
            lblDate.text = ""
        }
        
        let url = URL(string: viewModel.newsArticle.urlToImage)
        imgvNewsImage.kf.setImage(with: url)
    }
}
