//
//  NotificationPreference+Extensions.swift
//  Aura_iOS
//
//  Created by Ella A. Sadduq on 3/31/25.
//

//  NotificationPreference+Extensions.swift
//  Aura_iOS

import Foundation

extension NotificationPreference {
    
    /// Default reminder: once per day at 8:00 PM
    static var defaultOncePerDay: NotificationPreference {
        NotificationPreference(
            frequency: .oncePerDay,
            morningReminderTime: nil,
            eveningReminderTime: DateComponents(hour: 20, minute: 0), // 8 PM
            createdAt: Date(),
            lastUpdated: Date()
        )
    }
    
    /// Default reminder: twice per day at 9:00 AM and 8:00 PM
    static var defaultTwicePerDay: NotificationPreference {
        NotificationPreference(
            frequency: .twicePerDay,
            morningReminderTime: DateComponents(hour: 9, minute: 0),  // 9 AM
            eveningReminderTime: DateComponents(hour: 20, minute: 0), // 8 PM
            createdAt: Date(),
            lastUpdated: Date()
        )
    }
}
