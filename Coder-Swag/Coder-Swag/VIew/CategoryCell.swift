//
//  CategoryCell.swift
//  Coder-Swag
//
//  Created by S M HEMEL on 7/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!

    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
