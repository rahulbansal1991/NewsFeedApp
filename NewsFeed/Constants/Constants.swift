//
//  Constants.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation

struct Constants {
    static let API_KEY = "2ac6296bd4fc46c2abb4cd45afead4b6"
}

struct APIContants {
    
    private struct Domains {
        static let Dev = "https://newsapi.org"
        static let QA = "https://newsapi.org"
        static let UAT = "https://newsapi.org"
        static let Prod = "https://newsapi.org"
    }
    
    private struct Routes {
        static let Api = "/v2"
    }
    
    private static let BaseURL = Domains.Dev + Routes.Api
    
    enum Endpoints {
        case headlines
        
        var path: String {
            switch self {
                case .headlines: return BaseURL + "/top-headlines"
            }
        }
    }
}

enum Alerts {
    
    enum AlertTitle: String {
        case success = "Success"
        case fail = "Fail"
        case error = "Error"
    }
    
    enum AlertMessage: String {
        case ffeErrorAlert = "Failed. Please try again."
        case loginFail = "Login Failed. Please try again!"
        case invalidEmailID = "Invalid Email ID"
    }
    
    enum buttonLabels: String{
        case cancel = "Cancel"
        case ok = "OK"
    }
}
