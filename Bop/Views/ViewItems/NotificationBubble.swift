//
//  NotificationBubble.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-29.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct NotificationBubble: View {
    
    @State var notification: Notification
    
    var body: some View {
        ZStack {
            //Background()
            HStack {
                Text("Brad bopped you!")
                    .padding(.leading)
                    .foregroundColor(.white)
                Spacer()
                Button (action: {print("Rebopped")}) {
                    ZStack {
                        Text("Rebop")
                            .frame (width: 80, height: notificationHeight*0.75)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                }.padding(.trailing)
            }.frame(width: notificationWidth, height: notificationHeight)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay (
                    RoundedRectangle(cornerRadius: 15)
                        .stroke (ColorManager.button, lineWidth: 1)
            )
        }.padding(3)
    }
}

let sampleNotification = [
    Notification(sender: "Brad"),
    Notification(sender: "OtherGuy"),
    Notification(sender: "Brad")
]

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBubble(notification: sampleNotification[0])
    }
}
