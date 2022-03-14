//
//  NewsFeedViewModel.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation

typealias NewsFeedFetchingViewModelAPIResponse = (Bool) -> Void

final class NewsFeedViewModel {
    
    let newsFeedService = NewsFeedService()
    var arrNewsArticles = [Article]()
    
    func fetchNewsHeadlines(completion : @escaping NewsFeedFetchingViewModelAPIResponse) {
        
        // User preferred Country
        let country = UserPreferenceManager.shared.country
        
        newsFeedService.fetchNewsHeadlines(country: country) { status, data, error in
            
            if let responseData = data, status {
                self.arrNewsArticles = responseData.articles
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
