//
//  ConversationView.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-03.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct ConversationView: View {
    
    @State private var recipientUsername: String
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var chatController: ChatController
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                HStack {
                    Button (action: {self.viewRouter.currentPage = "dashboard"}) {
                        MiniBackArrowButtonView()
                    }
                    Spacer()
                }
                RecipientTitle(recipient: $recipientUsername)
                textFieldLine(width: 300)
                if !chatController.messages.isEmpty {
                    ScrollView(.vertical) {
                        ForEach(chatController.messages, id: \.messageId) {
                            message in ChatBubble(message: message, userDatabase: UserDatabaseQuery(user: testUser))
                        }
                    }
                }
                Spacer()
                Button (action: {self.chatController.sendMessage(recipientUsername: self.recipientUsername, content: "Bop!")}) {
                    RebopView()
                }
            }
        }.onAppear(perform: {self.chatController.receiveMessage(recipientUsername: self.recipientUsername)})
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(recipientUsername: "Brad Thomas", chatController: ChatController())
    }
}

var testUser: User = User(firstName: "Brad", lastName: "Thomas", email: "test@gmail.com", birthday: "07 22 2020", username: "Coolguy", authId: "id_testUser")

struct RecipientTitle: View {
    
    @Binding var recipient: String
    
    var body: some View {
        Text(recipient)
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(Color.white)
            
    }
}

struct RebopView: View {
    var body: some View {
        Text("Bop")
            .foregroundColor(.white)
            .cornerRadius(25)
            .frame(width: 230, height: 40)
            .background(ColorManager.button)
            .padding()
    }
}
