# Notifier

A simple way to use the NotificationCenter in SwiftUI

## Setting up listener

A view can have multiple listeners and the data can be processed in several ways

```swift
// Note that the listen modifiers do not need to be applied to a NavigationStack
struct MyView: View {

    var body: some View {
        NavigationStack {
            // your code
        }
            // No params are passed to the action
            .listen(for: "MyNotification1") { 
                // action
            }
            // The nullable [AnyHashable: Any]
            .listen(for: "MyNotification2") { params in
                // action
            }
            // The nullable [AnyHashable: T]
            // String was used here as a example
            .listen(for: "MyNotification3") { (params: [AnyHashable: String]?) in
                // action
            }
            // Get a specific key
            // The first parameter is the value of the key must always be nullable 
            // the second parameter it's all parameters (userInfo) in the notification
            .listen(for: "MyNotification3", key: "myKey") { (value: Int?, params: [AnyHashable: Any]?) in
                // action
            }
    }

}
```

## Sending notifications

Sending the notifications is extremely easy, just one line of code

```swift
// Without data
NotificationCenter.notify("MyNotification1")

// With Data
NotificationCenter.notify("MyNotification2", with: ["MyParam1": true, "MyParam2": "MyValue"])
```

## Using `Notification.Name`

Although the the examples for setting the listeners and sending the notifications were set using `Strings` for the notification names it's also possible to use `Notification.Name` for example

```swift
extension Notification.Name {
    static let myNotification = Notification.Name("myNotification")
}

// Usage example
NotificationCenter.notify(.myNotification)
```

## Roadmap

- [ ] Easily Manage Local Notifications
- [ ] Easily Manage Remote Notifications