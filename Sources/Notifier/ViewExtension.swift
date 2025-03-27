//
//  ViewExtension.swift
//  Notifier
//
//  Created by Pedro Cavaleiro on 27/03/2025.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15.0, tvOS 13.0, *)
extension View {
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The `Notification.Name` of the notification to listen for
    ///  - action: The action to execute when this listener is triggered, a nullable dictionary is passed to the action `[AnyHashable: Any]`
    /// - Returns: The modified view
    func listen(for notification: Notification.Name, action: @escaping (([AnyHashable: Any]?) -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: notification)) { notification in
                action(notification.userInfo)
            }
    }
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The name of the notification to listen for
    ///  - action: The action to execute when this listener is triggered, a nullable dictionary is passed to the action `[AnyHashable: Any]`
    /// - Returns: The modified view
    func listen(for notification: String, action: @escaping (([AnyHashable: Any]?) -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(notification))) { notification in
                action(notification.userInfo)
            }
    }
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The `Notification.Name` of the notification to listen for
    ///  - action: The action to execute when this listener is triggered, no argument is passed to the action
    /// - Returns: The modified view
    func listen(for notification: Notification.Name, action: @escaping (() -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: notification)) { _ in
                action()
            }
    }
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The name of the notification to listen for
    ///  - action: The action to execute when this listener is triggered, no argument is passed to the action
    /// - Returns: The modified view
    func listen(for notification: String, action: @escaping (() -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(notification))) { _ in
                action()
            }
    }
    
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The `Notification.Name` of the notification to listen for
    ///  - action: The action to execute when this listener is triggered, a nullable dictionary is passed to the action `[AnyHashable: T]` where T is the type of the value of the dictionary
    /// - Returns: The modified view
    func listen<T>(for notification: Notification.Name, action: @escaping (([AnyHashable: T]?) -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: notification)) { notification in
                if let userInfo = notification.userInfo as? [AnyHashable: T] {
                    action(userInfo)
                } else {
                    action(nil)
                }
            }
    }
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The name of the notification to listen for
    ///  - action: The action to execute when this listener is triggered, a nullable dictionary is passed to the action `[AnyHashable: T]` where T is the type of the value of the dictionary
    /// - Returns: The modified view
    func listen<T>(for notification: String, action: @escaping (([AnyHashable: T]?) -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(notification))) { notification in
                if let userInfo = notification.userInfo as? [AnyHashable: T] {
                    action(userInfo)
                } else {
                    action(nil)
                }
            }
    }
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The `Notification.Name` of the notification to listen for
    ///  - key: The key to serach in the notification dictionary
    ///  - action: The action to execute when this listener is triggered, the nullable value of type T is passed
    /// - Returns: The modified view
    func listen<T>(for notification: Notification.Name, key: String, action: @escaping ((T?, [AnyHashable: Any]) -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: notification)) { notification in
                if let userInfo = notification.userInfo, let element = userInfo[key], let castedElement = element as? T  {
                    action(castedElement, userInfo)
                } else {
                    action(nil, [:])
                }
            }
    }
    
    /// Listents for a event on the NotificationCenter
    /// - Parameters:
    ///  - notification: The name of the notification to listen for
    ///  - key: The key to serach in the notification dictionary
    ///  - action: The action to execute when this listener is triggered, the nullable value of type T is passed
    /// - Returns: The modified view
    func listen<T>(for notification: String, key: String, action: @escaping ((T?, [AnyHashable: Any]) -> ())) -> some View {
        self
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(notification))) { notification in
                if let userInfo = notification.userInfo, let element = userInfo[key], let castedElement = element as? T  {
                    action(castedElement, userInfo)
                } else {
                    action(nil, [:])
                }
            }
    }
    
}
