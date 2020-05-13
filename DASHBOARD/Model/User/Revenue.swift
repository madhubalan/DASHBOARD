//
//  Revenue.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct Revenue: Mappable {
    
    let improve: Double
    let target: Int
    let data: [RevenueData]
    
    init(map: Mapper) throws {
        try improve = map.from("improve")
        try target = map.from("target")
        data = map.optionalFrom("data") ?? []
    }
}
