//
//  BorderButton.swift
//  Swoosh
//
//  Created by S M HEMEL on 3/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.white.cgColor
    }

}
