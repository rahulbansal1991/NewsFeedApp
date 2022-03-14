//
//  NewsFeedDetailViewModel.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import UIKit

final class NewsFeedDetailViewModel {

    let newsArticle : Article!

    init(withNewsArticle newsArticle : Article) {
        self.newsArticle = newsArticle
    }
}
