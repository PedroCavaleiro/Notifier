//
// NotificationCenterExtension.swift
// Notifier
//
// Created by Pedro Cavaleiro on 07/03/2025
//

import Foundation

extension NotificationCenter {
    
    /// Notifiers all listeners for a certain `Notification.name`
    /// - Parameters:
    ///  - listener: The `Notification.Name` to send the notification to
    ///  - object: The `[AnyHashable: Any]` with data to send with the notification, defaults to nil
    static func notify(_ listener: Notification.Name, with object: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: listener, object: nil, userInfo: object)
    }
    
    /// Notifiers all listeners for a certain notification
    /// - Parameters:
    ///  - listener: The notification name to send the notification to
    ///  - object: The `[AnyHashable: Any]` with data to send with the notification, defaults to nil
    static func notify(_ listener: String, with object: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: Notification.Name(listener), object: nil, userInfo: object)
    }
    
}
