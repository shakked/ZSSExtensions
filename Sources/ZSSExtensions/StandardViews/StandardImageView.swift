//
//  RoundedImageView.swift
//  Command
//
//  Created by Zachary Shakked on 1/20/18.
//  Copyright © 2018 Zachary Shakked. All rights reserved.
//

import UIKit

public class StandardImageView: UIImageView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var borderColor: UIColor? = nil {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

}
