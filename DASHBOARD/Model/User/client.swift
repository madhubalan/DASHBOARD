//
//  Client.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//



import UIKit
import Mapper

struct Client: Mappable {
    
    let name: String?
    let accountNo: Int
    let activity: [ClientActivity]
    
    init(map: Mapper) throws {
        name = map.optionalFrom("name")
        try accountNo = map.from("account_no")
        activity = map.optionalFrom("activity") ?? []
    }
    
}
