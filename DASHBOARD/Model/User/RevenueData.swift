//
//  RevenueData.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import Mapper

struct RevenueData: Mappable {
    
    let amount: Int
    let date: String?
   
    
    init(map: Mapper) throws {
        try amount = map.from("amount")
        date = map.optionalFrom("date")
    }
    
}

