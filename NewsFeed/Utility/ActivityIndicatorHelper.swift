//
//  ActivityIndicatorHelper.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation
import UIKit
import MBProgressHUD

enum LoadingIndicatorPosition {
    case Center
    case Top
}

class ActivityIndicatorHelper {
    
    static var sharedInstance = ActivityIndicatorHelper()
    
    var isManualOverride : Bool = false
    
    var loadingHUD : MBProgressHUD? = nil
    
    init() {
        
    }
    
    private func startLoader(withText text: String?) {
        
        if let window = UIApplication.shared.keyWindow {
                    
            // HUD exists already
            if (loadingHUD != nil) && (window.viewWithTag(96800) != nil) {
                
                // Check if loading already exists and its in hidden mode
                loadingHUD!.show(animated: true)
                
            } else {
                // No HUD exists so add one
                loadingHUD = MBProgressHUD.showAdded(to: window, animated: true)
                loadingHUD!.tag = 96800
            }
            
            if let hudText = text {
                loadingHUD!.label.text = hudText
            }
        }
    }
    
    private func stopLoader(_ animationStopped: @escaping () -> Void) {
        
        if UIApplication.shared.keyWindow != nil {
            
            if loadingHUD != nil {
                
                if isManualOverride {
                    
                    // Don't proceed as manual override is enabled, send the callback
                    animationStopped()
                    
                } else {
                    
                    loadingHUD!.hide(animated: true)
                    animationStopped()

                }
            }
        }
    }
    
    private func enableManualOverride() {
        isManualOverride = true
    }
    
    private func disableManualOverride() {
        isManualOverride = false
    }
    
    func showLoadingIndicator(withText message : String, blockUI : Bool = false) {
        
        if blockUI {
            enableManualOverride()
        }
        
        startLoader(withText: message)
    }
    
    func showLoadingIndicator(withText message : String, position: LoadingIndicatorPosition, blockUI : Bool = false) {
        
        showLoadingIndicator(withText: message)
        
        if position == .Top {
            loadingHUD?.center = CGPoint(x: (loadingHUD?.center.x)!, y: 200)
        }
    }
    
    func hideLoadingIndicator(blockUI : Bool = false) {
     
        if blockUI {
            disableManualOverride()
        }
        
        stopLoader {}
    }
}
