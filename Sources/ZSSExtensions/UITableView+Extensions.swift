//
//  UITableView+Extensions.swift
//  Command
//
//  Created by Zachary Shakked on 12/15/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//


import UIKit

public extension UITableView {
    
    // MARK: Layout

    func prepareForSelfSizing(estimatedItemHeight e: CGFloat = 80) {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = e
    }
    
    // MARK: Dequeue
    
    func dequeueCell<T: ReusableView>(for indexPath: IndexPath) -> T {
        return dequeueCell(withIdentifier: T.reuseIdentifier, for: indexPath)
    }
    
    func dequeueCell<T>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else { fatalError("Type not registered with identifier: \(identifier)") }
        return cell
    }
    
    func dequeueHeaderFooter<T: ReusableView>() -> T {
        return dequeueHeaderFooter(withIdentifier: T.reuseIdentifier)
    }
    
    func dequeueHeaderFooter<T>(withIdentifier identifier: String) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else { fatalError("Type not registered with identifier: \(identifier)") }
        return view
    }
    
    // MARK: Registration
    
    func registerCell(type: ReusableView.Type) {
        if let nib = UINib(potentialName: String(describing: type)) {
            register(nib, forCellReuseIdentifier: type.reuseIdentifier)
            return
        }
        
        register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func registerCells(types: ReusableView.Type...) {
        types.forEach { registerCell(type: $0) }
    }
    
    func registerHeaderFooterView(type: ReusableView.Type) {
        if let nib = UINib(potentialName: String(describing: type)) {
            register(nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
            return
        }
        
        register(type.self, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
}
