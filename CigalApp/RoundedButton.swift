//
//  RoundedButton.swift
//  CigalApp
//
//  Created by Andrés Pizá Bückmann on 21/02/2019.
//  Copyright © 2019 Andrés Pizá Bückmann. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        clipsToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}
