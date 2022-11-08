//
//  ReuseableView.swift
//  Command
//
//  Created by Zachary Shakked on 12/15/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol ReusableView: NSObjectProtocol {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    
    // Note this default will work unless:
    // 1. The cell is a subclass of another ReusableView
    // 2. The nib name is different from the class name
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
