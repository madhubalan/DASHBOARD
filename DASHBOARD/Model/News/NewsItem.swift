//
//  NewsItem.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct NewsItem: Mappable {
    
    let publisher: String?
    let title: String?
    let date: String?
    let securities: Securities?
    
    init(map: Mapper) throws {
        publisher = map.optionalFrom("publisher")
        title = map.optionalFrom("title")
        date = map.optionalFrom("date")
        securities = map.optionalFrom("securities")
    }
    
}
