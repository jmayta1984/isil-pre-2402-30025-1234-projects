//
//  ContentView.swift
//  Notifications
//
//  Created by user272495 on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request notification permission") {
                requestNotificationPermission()
            }
            
            Button("Schedule notification") {
                scheduleNotification()
            }
        }
        .padding()
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Success: \(granted)")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Local notification"
        content.body = "A schedule notification example"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Success")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
