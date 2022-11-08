//
//  HapticFeedback.swift
//  Command
//
//  Created by Zachary Shakked on 12/28/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit

public final class HapticFeedback {
    
    public static let shared: HapticFeedback = HapticFeedback()
    public let selection: UISelectionFeedbackGenerator
    public let impact: UIImpactFeedbackGenerator
    public let notification: UINotificationFeedbackGenerator
    
    init() {
        selection = UISelectionFeedbackGenerator()
        selection.prepare()
        
        impact = UIImpactFeedbackGenerator()
        impact.prepare()
        
        notification = UINotificationFeedbackGenerator()
        notification.prepare()
    }
    
    // MARK: Public type methods - Haptic Feedback
    
    /// Performs haptic feedback - selection.
    public static func performFeedbackSelection() {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UISelectionFeedbackGenerator()
            feedbackGenerator.prepare()
            feedbackGenerator.selectionChanged()
        }
    }
    
    /// Performs haptic feedback - impact.
    public static func performFeedbackImpact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
            feedbackGenerator.prepare()
            feedbackGenerator.impactOccurred()
        }
    }
    
    /// Performs haptic feedback - notification.
    public static func performFeedbackNotification(type: UINotificationFeedbackGenerator.FeedbackType) {
        if #available(iOS 10.0, *) {
            let feedbackGenerator = UINotificationFeedbackGenerator()
            feedbackGenerator.prepare()
            feedbackGenerator.notificationOccurred(type)
        }
    }
}

