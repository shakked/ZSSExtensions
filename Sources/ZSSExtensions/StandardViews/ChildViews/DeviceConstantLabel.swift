//
//  DeviceConstantLabel.swift
//
//
//  Copyright © 2019 Zachary Shakked. All rights reserved.
//

import Foundation
import UIKit

public class DeviceConstantLabel: StandardLabel {
    
    @IBInspectable public var smallFontSize: CGFloat = 0.0 {
        didSet {
            if smallFontSize != 0.0, DeviceConstants.currentSize == .small {
                font = font.withSize(smallFontSize)
            }
        }
    }
    
    @IBInspectable public var mediumFontSize: CGFloat = 0.0 {
        didSet {
            if mediumFontSize != 0.0, DeviceConstants.currentSize == .medium {
                font = font.withSize(mediumFontSize)
            }
        }
    }
    
    @IBInspectable public var largeFontSize: CGFloat = 0.0 {
        didSet {
            if largeFontSize != 0.0, DeviceConstants.currentSize == .large {
                
                font = font.withSize(largeFontSize)
            }
        }
    }
    
    @IBInspectable public var smallText: String = "" {
        didSet {
            if smallText != "", DeviceConstants.currentSize == .small {
                text = smallText
            }
        }
    }
    
    @IBInspectable public var mediumText: String = "" {
        didSet {
            if mediumText != "", DeviceConstants.currentSize == .medium {
                text = mediumText
            }
        }
    }
    
    @IBInspectable public var largeText: String = "" {
        didSet {
            if largeText != "", DeviceConstants.currentSize == .large {
                text = largeText
            }
        }
    }
}
