//
//  UILabel+Extensions.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 12/9/20.
//

import UIKit

public extension UILabel {
    
    public func setLetterSpacing(_ spacing: CGFloat) {
        let text = self.text ?? ""
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        self.attributedText = attributedStr
    }
}
