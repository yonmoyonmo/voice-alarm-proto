//
//  NotificationManager.swift
//  voice-alarm-shit
//
//  Created by yonmo on 2021/10/20.
//

import Foundation
import UserNotifications
import CoreLocation

class NotificationManager{
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ErrorL \(error)")
            }else{
                print("success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Local Notification Test"
        content.subtitle = "testsss"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "_2021-10-21 10:48:35.m4a") )
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        // calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 5
//        dateComponents.minute = 47
//        dateComponents.weekday = 4
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
