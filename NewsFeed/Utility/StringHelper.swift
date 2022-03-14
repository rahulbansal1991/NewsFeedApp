//
//  StringHelper.swift
//  NewsFeed
//
//  Created by Rahul Bansal on 14/03/22.
//

import Foundation

//MARK:- string to date conversion
extension String {
    
    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}
