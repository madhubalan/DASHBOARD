//
//  User.swift
//  WEINVEST
//
//  Created by Madhu on 31/08/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Mapper

struct User: Mappable {
    
    let name: String?
    let secondName: String?
    let image: String?
    let email: String?
    let revenue : Revenue?
    let commission : Commission?
    let clients : [Client]
    
    init(map: Mapper) throws {
        name = map.optionalFrom("name")
        secondName = map.optionalFrom("second_name")
        image = map.optionalFrom("image")
        email = map.optionalFrom("email")
        revenue = map.optionalFrom("revenue")
        commission = map.optionalFrom("commission")
        clients = map.optionalFrom("clients") ?? []
    }
    
}
