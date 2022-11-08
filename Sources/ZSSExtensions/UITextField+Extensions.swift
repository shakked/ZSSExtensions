//
//  UITextField+Extensions.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 12/9/20.
//

import UIKit

public extension UITextField {

    public func setPlaceholderLetterSpacing(_ spacing: CGFloat){
        let text = self.placeholder ?? ""
        let attributedString = NSMutableAttributedString(string: self.placeholder!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text.count))
        self.attributedPlaceholder = attributedString
    }

    public func setLetterSpacing(_ spacing: CGFloat){
        let text = self.text ?? ""
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text.count))
        self.attributedText = attributedString
    }
}
