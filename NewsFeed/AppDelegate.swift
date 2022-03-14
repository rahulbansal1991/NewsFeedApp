//
//  AppDelegate.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Added Firebase for crash logs and tracking
        FirebaseApp.configure()
        
        return true
    }

}

