//
//  WINetworkManager.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class WINetworkManager: NSObject {
    
    //Singleton Class
    
    static let sharedInstance = WINetworkManager()
    
    //MARK: API Calls
    
    func getUser() -> User? {
        
        if let userDictionary = Helper.getJsonFrom(name: "user", ext: "json"),
            let user = User.from(userDictionary) // Mapping User json to swift object
        {
            return user
        }
        else {
            //show popup
        }
        return nil
    }
    
    func getNews() -> News? {
        
        if let userDictionary = Helper.getJsonFrom(name: "news", ext: "json"),
            let news = News.from(userDictionary) // Mapping News json to swift object
        {
            return news
        }
        else {
            //show popup
        }
        return nil
        
    }
}
