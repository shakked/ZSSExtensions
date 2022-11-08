//
//  StandardLabel.swift
//  Command
//
//  Created by Zachary Shakked on 6/26/18.
//  Copyright © 2018 Zachary Shakked. All rights reserved.
//

import UIKit

public class StandardLabel: UILabel {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public override var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable public var kerning: CGFloat = -1000.0 {
        didSet {
            guard kerning != -1000 else {
                return
            }
            updateText(attribute: NSAttributedString.Key.kern, value: kerning)
        }
    }
    
    public override var text: String? {
        didSet {
            let kerning = self.kerning
            self.kerning = kerning
        }
    }
    
    fileprivate func updateText(attribute: NSAttributedString.Key, value: Any) {
        if let text = attributedText {
            let attributedText = NSMutableAttributedString(attributedString: text.attributedSubstring(from: NSRange(location: 0, length: text.length)))
            attributedText.addAttribute(attribute, value: value, range: NSRange(location: 0, length: text.length))
            self.attributedText = attributedText
        } else if let text = self.text {
            let attributedText = NSAttributedString(string: text, attributes: [
                attribute: value,
                ]
            )
            self.attributedText = attributedText
        }
    }
}
