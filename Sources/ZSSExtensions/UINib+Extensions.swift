//
//  UINib+Extensions.swift
//  Command
//
//  Created by Zachary Shakked on 12/15/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit

public extension UINib {
    convenience init?(potentialName name: String, bundle: Bundle = Bundle.main) {
        guard UINib.exists(nibName: name, bundle: bundle) else { return nil }
        self.init(nibName: name, bundle: bundle)
    }
    
    static func exists(nibName name: String, bundle: Bundle = Bundle.main) -> Bool {
        return bundle.path(forResource: name, ofType:"nib") != nil
    }
}

