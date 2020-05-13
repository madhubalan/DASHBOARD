//
//  ClientActivity.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct ClientActivity: Mappable {
    
    let tag: String?
    let price: Double
    let notificationCount: Int
    let date: String?
    
    
    init(map: Mapper) throws {
        tag = map.optionalFrom("tag")
        try price = map.from("price")
        try notificationCount = map.from("notification_count")
        date = map.optionalFrom("date")
    }
    
}

