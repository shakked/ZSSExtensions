//
//  DeviceConstants.swift
//
//
//  Copyright © 2019 Zachary Shakked. All rights reserved.
//

import Foundation
import DeviceKit

public struct DeviceConstants {
    
    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    
    public init(small: CGFloat, medium: CGFloat, large: CGFloat) {
        self.small = small
        self.medium = medium
        self.large = large
    }
    
    public enum Size {
        case small, medium, large
    }
    
    public static var currentSize: Size {
        if Device.current.isPad {
            return .small
        }

        switch Device.current.realDevice {

        case .iPhoneSE, .iPhone4, .iPhone4s, .iPhone5, .iPhone5c, .iPhone5s, .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2:
            return .small
        case .iPhone6Plus, .iPhone7Plus, .iPhone8Plus, .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhone11, .iPhone11Pro, .iPhone12, .iPhone12Pro, .iPhone12Mini, .iPhone13, .iPhone13Pro:
            return .medium
        case .iPhoneXSMax, .iPhone11ProMax, .iPhone12ProMax, .iPhone13ProMax:
            return .large
        default:
            return .medium
        }
    }
}
