//
//  Category.swift
//  Coder-Swag
//
//  Created by S M HEMEL on 7/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    init(title: String, imageName: String){
        self.title = title
        self.imageName = imageName
    }
}
