//
//  Constraint.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/21/20.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public class Constraint {

    /// Note: This class is designed
    /// to make dynamic layout arrangement easy and
    /// to optimize NSLayoutConstraint related template generating code amount

    public static func activate(_ constraints: [NSLayoutConstraint]...) {
        for constraints in constraints {
            NSLayoutConstraint.activate(constraints)
        }
    }

    public static func activate(_ constraints: [[NSLayoutConstraint]]) {
        for constraints in constraints {
            NSLayoutConstraint.activate(constraints)
        }
    }

    public static func pin(_ view: UIView, to toView: UIView, top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        if let top = top {
            constraints.append(view.topAnchor.constraint(equalTo: toView.topAnchor, constant: top))
        }
        if let bottom = bottom {
            constraints.append(view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: bottom))
        }
        if let left = left {
            constraints.append(view.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: left))
        }
        if let right = right {
            constraints.append(view.rightAnchor.constraint(equalTo: toView.rightAnchor, constant: right))
        }
        return constraints
    }

    public static func rows(_ views: [UIView], spacing: [CGFloat]) -> [NSLayoutConstraint] {
        guard views.count > 1 else { return [NSLayoutConstraint]() }
        var currentSpacing = spacing[safe: 0] ?? 0
        var constraints = [NSLayoutConstraint]()
        for (index, view) in views.enumerated() {
            if index > 0 {
                currentSpacing = spacing[safe: index - 1] ?? currentSpacing
                constraints.append(view.topAnchor.constraint(equalTo: views[index - 1].bottomAnchor, constant: currentSpacing))
            }
        }
        return constraints
    }

    public static func columns(_ views: [UIView], spacing: [CGFloat]) -> [NSLayoutConstraint] {
        guard views.count > 1 else { return [NSLayoutConstraint]() }
        var currentSpacing = spacing[safe: 0] ?? 0
        var constraints = [NSLayoutConstraint]()
        for (index, view) in views.enumerated() {
            if index > 0 {
                currentSpacing = spacing[safe: index - 1] ?? currentSpacing
                constraints.append(view.leftAnchor.constraint(equalTo: views[index - 1].rightAnchor, constant: currentSpacing))
            }
        }
        return constraints
    }

    public static func equalCenterX(_ views: UIView...) -> [NSLayoutConstraint] {
        return equalCenterX(views)
    }

    static func equalCenterX(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.centerXAnchor.constraint(equalTo: v.centerXAnchor)
        }
    }

    public static func equalCenterY(_ views: UIView...) -> [NSLayoutConstraint] {
        return equalCenterY(views)
    }

    public static func equalWidths(_ views: UIView...) -> [NSLayoutConstraint] {
        return equalWidths(views)
    }

    static func equalCenterY(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.centerYAnchor.constraint(equalTo: v.centerYAnchor)
        }
    }

    public static func equalLeftAnchor(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.leftAnchor.constraint(equalTo: v.leftAnchor)
        }
    }

    public static func equalRightAnchor(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.rightAnchor.constraint(equalTo: v.rightAnchor)
        }
    }

    public static func equalTopAnchor(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.topAnchor.constraint(equalTo: v.topAnchor)
        }
    }

    static func equalWidths(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.widthAnchor.constraint(equalTo: v.widthAnchor)
        }
    }

    public static func equalHeights(_ views: [UIView]) -> [NSLayoutConstraint] {
        guard let v = views.first else { return [NSLayoutConstraint]() }
        return views.suffix(from: 1).map {
            return $0.heightAnchor.constraint(equalTo: v.heightAnchor)
        }
    }

    public static func size(_ view: UIView, height: CGFloat? = nil, width: CGFloat? = nil) -> [NSLayoutConstraint] {
        return [
            height == nil ? nil : view.heightAnchor.constraint(equalToConstant: height!),
            width == nil ? nil : view.widthAnchor.constraint(equalToConstant: width!)
        ].compactMap({ $0 })
    }
}
