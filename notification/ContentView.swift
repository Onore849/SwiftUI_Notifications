//
//  ContentView.swift
//  notification
//
//  Created by 野澤拓己 on 2020/09/02.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alert = false
    
    
    var body: some View {
        
        Button(action: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (status, _) in
                
                if status{
                    
                    let content = UNMutableNotificationContent()
                    content.title = "Notification"
                    content.body = "Hello From Kavsoft!!"
                    
                    // this is interval represents the delay time of notification
                    // ie. , the notification will be delivered after the delay....
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    
                    return
                }
                
                self.alert.toggle()
            }
            
        }) {
            
            Text("Send Notification")
            
        }.alert(isPresented: $alert) {
            
            return Alert(title: Text("Please Enable Notification Access In Settings Panel !!!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
