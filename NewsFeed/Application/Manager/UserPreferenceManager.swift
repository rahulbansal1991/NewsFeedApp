//
//  UserPreferenceManager.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation

class UserPreferenceManager {
    
    static var shared : UserPreferenceManager = {
        let manager = UserPreferenceManager()
        return manager
    }()
    
    private init() {
        // make the constructor private
        userCountry = fetchUserCountryPreference()
    }
    
    var country : String {
        return userCountry
    }
    
    // Set default country as US
    private var userCountry : String!
    
    func fetchUserCountryPreference() -> String {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "UserPreferredCountry") ?? "us"
    }
    
    func saveUserCountryPreference(value : String) {
        
        userCountry = value
        
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "UserPreferredCountry")
        defaults.synchronize()
    }
}
