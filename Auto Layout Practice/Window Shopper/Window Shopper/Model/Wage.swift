//
//  Wage.swift
//  Window Shopper
//
//  Created by S M HEMEL on 6/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import Foundation
class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        print(Int(ceil(price / wage)))
        return Int(ceil(price / wage))
    }
}
