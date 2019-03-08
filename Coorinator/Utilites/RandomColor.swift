//
//  RandomColor.swift
//  Coorinator
//
//  Created by Radislav Gaynanov on 07/03/2019.
//  Copyright © 2019 Radislav Gaynanov. All rights reserved.
//

import UIKit

extension UIColor {
    func randomColor() -> UIColor {
        let Red:CGFloat = CGFloat(arc4random_uniform(256))
        let Green:CGFloat = CGFloat(arc4random_uniform(256))
        let Blue:CGFloat = CGFloat(arc4random_uniform(256))
        let myColor = UIColor(red: Red/255, green: Green/255, blue: Blue/255, alpha: 1.0)
        return myColor
    }
}
