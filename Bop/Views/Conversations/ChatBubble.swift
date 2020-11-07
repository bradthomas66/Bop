//
//  ChatBubble.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-03.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct ChatBubble: View {
    
    var message: Message
    @ObservedObject var userDatabase: UserDatabaseQuery
    
    var body: some View {
        ZStack {
            HStack {
                if message.isMe {
                    Spacer()
                }
                VStack {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(self.message.isMe ? ColorManager.button : ColorManager.lightGrey)
                        Text(message.content)
                            .foregroundColor(message.isMe ? .white : .gray)
                            .italic()
                    }
                    Text(userDatabase.user.firstName)
                        .font(.footnote)
                        .foregroundColor(message.isMe ? ColorManager.button : .white)
                }.padding(.leading,30)
                    .padding(.trailing, 30)
                if !message.isMe {
                    Spacer()
                }
            }.onAppear(perform: {self.userDatabase.getUserDataById(id: self.message.senderId)})
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all)
            ChatBubble(message: sampleConversation[0], userDatabase: UserDatabaseQuery(user: testUser))
        }
        
    }
}

let sampleConversation = [
    Message (content: "Bop", sender: "Brad", recipient: "NotBrad", senderAuthId: "id_sampleConversation"),
    Message (content: "Bop", sender: "Brad", recipient: "NotBrad", senderAuthId: "id_sampleConversation")
]


