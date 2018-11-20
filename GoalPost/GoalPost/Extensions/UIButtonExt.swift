//
//  UIButtonExt.swift
//  GoalPost
//
//  Created by Azizul Hoq on 11/17/18.
//  Copyright © 2018 Azizul Hoq. All rights reserved.
//

import UIKit

extension UIButton {
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.3016467392, green: 0.7468368411, blue: 0.3395946622, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.6506131291, green: 0.8722513318, blue: 0.6690511107, alpha: 1)
    }
}
