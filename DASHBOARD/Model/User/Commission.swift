//
//  Commission.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct Commission: Mappable {
    
    let improve: Double
    let data: [CommissionData]
    
    
    init(map: Mapper) throws {
        try improve = map.from("improve")
        data = map.optionalFrom("data") ?? []
    }
    
}

