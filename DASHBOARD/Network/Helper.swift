//
//  Helper.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class Helper {
    
    class func getJsonFrom(name : String, ext : String) -> NSDictionary? {
        
        if let path = Bundle.main.path(forResource: name, ofType: ext) {
            do {
                // get the file path
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                // serialize the json object to Dictionary (Foundation object)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                // optional buinding
                if let jsonResult = jsonResult as? NSDictionary {
                    return jsonResult
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}
