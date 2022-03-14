//
//  NewsFeedViewController.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import UIKit

class NewsFeedViewController: UIViewController {

    static let CellReuseIdentifier = "NewsFeedTableViewCell"
    
    private var viewModel : NewsFeedViewModel = NewsFeedViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        loadNews()
    }

    func setup() {
        
        setNavigationBarTitle(title: "News Headlines")
        
        tableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: NewsFeedViewController.CellReuseIdentifier)
        
        addPullToRefresh()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    func loadNews() {
        viewModel.fetchNewsHeadlines { status, error in
            
            if status {
                // Load data in tableview
                self.tableView.reloadData()
            } else {
                // Prompt error on screen
                Utility.showAlertWithOkButton(controller: self, title: Alerts.AlertTitle.error.rawValue, message: error)
            }
        }
    }

    @objc func refreshData(_ sender: AnyObject) {
        
        refreshControl.endRefreshing()
        
        loadNews()
    }
    
    func navigateToNewsDetailScreen(newsArticle: Article) {
        let newsDetailVC = NewsDetailViewController.instantiateViewController(newsArticle: newsArticle)
        self.navigationController?.pushViewController(newsDetailVC, animated: true)
    }
}

extension NewsFeedViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrNewsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedViewController.CellReuseIdentifier, for: indexPath) as? NewsFeedTableViewCell {
            
            cell.configure(newsArticle: viewModel.arrNewsArticles[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Navigate to News Detail screen
        navigateToNewsDetailScreen(newsArticle: viewModel.arrNewsArticles[indexPath.row])
    }
}
