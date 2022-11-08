//
//  UICollectionView+Extensions.swift
//  Command
//
//  Created by Zachary Shakked on 12/15/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit

import UIKit

extension UICollectionView {
    
    // MARK: Deque
    
    public func dequeueCell<T: ReusableView>(for indexPath: IndexPath) -> T {
        return dequeueCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath)
    }
    
    public func dequeueCell<T>(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else { fatalError("Type not registered with identifier: \(identifier)") }
        return cell
    }
    
    public func dequeueHeaderFooter<T: ReusableView>(ofKind kind: String, for indexPath: IndexPath) -> T {
        return dequeueHeaderFooter(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath)
    }
    
    public func dequeueHeaderFooter<T>(ofKind kind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? T else { fatalError("Type not registered with identifier: \(identifier)") }
        return view
    }
    
    // MARK: Registration
    
    public func registerCell(type: ReusableView.Type) {
        if let nib = UINib(potentialName: String(describing: type)) {
            register(nib, forCellWithReuseIdentifier: type.reuseIdentifier)
            return
        }
        
        register(type.self, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerCells(types: ReusableView.Type...) {
        types.forEach { registerCell(type: $0) }
    }
    
    public func registerHeader(type: ReusableView.Type) {
        if let nib = UINib(potentialName: String(describing: type)) {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.reuseIdentifier)
            return
        }
        
        register(type.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.reuseIdentifier)
    }
    
    public func registerFooter(type: ReusableView.Type) {
        if let nib = UINib(potentialName: String(describing: type)) {
            register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: type.reuseIdentifier)
            return
        }
        
        register(type.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: type.reuseIdentifier)
    }
    
}

