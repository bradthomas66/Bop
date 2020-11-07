//
//  Message.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-14.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation
import Firebase

// Message parameters

struct Message {
    
    let content: String
    let isMe: Bool
    let messageId = UUID()
    let senderId: String
    let senderAuthId: String
    let recipientId: String
    
    init (content: String, sender: String, recipient: String, senderAuthId: String ) {
        self.content = content
        self.senderId = sender
        self.recipientId = recipient
        self.senderAuthId = senderAuthId
        
        if senderAuthId == Auth.auth().currentUser?.uid {
            self.isMe = true
        } else {
            self.isMe = false
        }
    }
}

