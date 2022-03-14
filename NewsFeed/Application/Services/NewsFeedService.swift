//
//  NewsFeedService.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation

typealias ResponseFetchCompleted = (Bool, News?, String?) -> Void

final class NewsFeedService {
    
    var client : DataProvider! = ClientHTTPNetworking()
    
    func queryString(_ value: String, params: [String: String]) -> String? {
        var components = URLComponents(string: value)
        components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: element.value) }

        return components?.url?.absoluteString
    }
    
    func fetchNewsHeadlines(country: String, completion : @escaping ResponseFetchCompleted) {
        
        let parameters = ["country" : country, "apiKey" : "2ac6296bd4fc46c2abb4cd45afead4b6"]

        guard let strURL = queryString(APIContants.Endpoints.headlines.path, params: parameters) else { return completion(false, nil, "URL conversion Failed") }
        
        let url = URL(string: strURL)!
        
        // Show loading indicator
        ActivityIndicatorHelper.sharedInstance.showLoadingIndicator(withText: "")
        
        client.fetchRemoteDataDictionary(News.self, url: url, parameterDictionary: nil, httpMethod: "GET") { result in
            
            switch result {
                
            case .failure(let error):
                DispatchQueue.main.async {
            
                    // Hide loading indicator
                    ActivityIndicatorHelper.sharedInstance.hideLoadingIndicator()
                    
                    completion(false, nil, error.reason)
                }
                
            case .success(let response):
                DispatchQueue.main.async {
                    
                    // Hide loading indicator
                    ActivityIndicatorHelper.sharedInstance.hideLoadingIndicator()
                    
                    if let response = response as? News {
                        completion(true, response, nil)
                    }
                }
            }
        }
    }
    
}
