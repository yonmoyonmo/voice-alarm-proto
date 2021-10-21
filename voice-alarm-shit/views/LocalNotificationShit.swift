//
//  LocalNotificationShit.swift
//  voice-alarm-shit
//
//  Created by yonmo on 2021/10/20.
//

import SwiftUI

struct LocalNotificationShit: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Button("request permissions") {
                    NotificationManager.instance.requestAuthorization()
                }
                Button("test notification") {
                    NotificationManager.instance.scheduleNotification()
                }
                Button("cancel notification") {
                    NotificationManager.instance.cancelNotification()
                }
                Divider()
                NavigationLink(destination: AlarmSettingView(audioRecorder: AudioRecorder())) {
                    Text("set alarm")
                }
                
            }.onAppear{
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
            .navigationBarTitle("voice alarm test")
        }
    }
}

struct LocalNotificationShit_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationShit()
    }
}
