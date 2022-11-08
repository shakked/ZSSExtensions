//
//  UIDevice+Extensions.swift
//  Command
//
//  Created by Zachary Shakked on 3/9/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit
import DeviceKit

public extension UIDevice {
    static var modelName: String {
        return Device.current.description
    }
}
