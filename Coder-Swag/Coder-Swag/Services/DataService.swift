//
//  DataService.swift
//  Coder-Swag
//
//  Created by S M HEMEL on 7/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRT", imageName: "shirts.png"),
        Category(title: "HOODIE", imageName: "hoodies.png"),
        Category(title: "HAT", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
}
