//
//  News.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct News: Mappable {

    let data : [NewsItem]
    
    init(map: Mapper) throws {
        data = map.optionalFrom("data") ?? []
    }
    
}
