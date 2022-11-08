//
//  UIButton+Extensions.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 12/9/20.
//

import UIKit

public extension UIButton {

    public func setLetterSpacing(_ spacing: CGFloat) {
        let text = self.titleLabel?.text ?? ""
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }

    public func setAttributedLetterSpacing(_ spacing: CGFloat) {
        let text = self.titleLabel?.attributedText ?? NSAttributedString()
        let attributedString = NSMutableAttributedString(attributedString: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text.length))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
