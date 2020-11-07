//
//  ConversationList.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-16.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct ConversationList: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        ConversationTitle()
                        Spacer()
                    }
                    HStack {
                        Button (action: {self.viewRouter.currentPage = "dashboard"}) {
                            MiniBackArrowButtonView()
                        }
                        Spacer()
                        Button (action: {self.viewRouter.currentPage = "contacts"}) {
                            ContactIcon()
                        }
                    }
                }
                textFieldLine(width: 300)
                    .padding(.bottom, 60)
                
                VStack {
                    Button (action: {
                        
                        self.viewRouter.recipient = "User1" // replace with contact name of contacts where conversationStarted = true
                        self.viewRouter.currentPage = "conversation"
                        
                    }) {
                        Text("Brad Thomas")
                    }.padding()
                    Button (action: {
                        
                        self.viewRouter.recipient = "User2"
                        self.viewRouter.currentPage = "conversation"
                        
                    }) {
                        Text("Mike Thomas")
                    }.padding()
                }
                Spacer()
            }
        }
    }
}

struct BopversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationList()
    }
}

struct ConversationTitle: View {
    var body: some View {
        Text("Conversations")
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(Color.white)
            .padding(.top, Constants.verticalPadding)
    }
}

struct BackArrowIcon: View {
    var body: some View {
        Image(systemName: "arrowshape.turn.up.left")
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .font(.title)
            .padding(.leading, 15)
    }
}
