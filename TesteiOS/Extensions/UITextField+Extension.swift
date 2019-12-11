//
//  UITextField+Extension.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 10/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setLeftPadding(_ value: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(_ value: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
