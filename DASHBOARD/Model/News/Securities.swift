//
//  Securities.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct Securities: Mappable {
    
    let symbol: String?
    let price: Double
    let change: Double
    let percentChange: Double
    
    init(map: Mapper) throws {
        symbol = map.optionalFrom("symbol")
        try price = map.from("price")
        try change = map.from("change")
        try percentChange = map.from("percent_change")
    }
    
}
