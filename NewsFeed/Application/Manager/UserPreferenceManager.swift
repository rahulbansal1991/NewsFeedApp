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
        
    }
    
    var country : String {
        return userCountry
    }
    
    // Set default country as US
    private var userCountry : String = "us"
    
    func fetchUserCountryPreference() {
        let defaults = UserDefaults.standard
        userCountry = defaults.string(forKey: "UserPreferredCountry") ?? "us"
    }
    
    func saveUserCountryPreference() {
        let defaults = UserDefaults.standard
        defaults.set(userCountry, forKey: "UserPreferredCountry")
        defaults.synchronize()
    }
}
