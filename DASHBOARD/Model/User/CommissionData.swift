//
//  CommissionData.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct CommissionData: Mappable {
    
    let diyPassive: Int
    let diyThematic: Int
    let rmPassive: Int
    let rmThematic : Int
    
    init(map: Mapper) throws {
        try diyPassive = map.from("diy_passive")
        try diyThematic = map.from("diy_thematic")
        try rmPassive = map.from("rm_passive")
        try rmThematic = map.from("rm_thematic")
    }
    
}
