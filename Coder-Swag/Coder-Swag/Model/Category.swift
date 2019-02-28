//
//  Category.swift
//  coder-swag
//
//  Created by Mark Price on 6/27/17.
//  Copyright © 2017 Devslopes. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
