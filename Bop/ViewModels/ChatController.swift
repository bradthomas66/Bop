//
//  ChatController.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-14.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Firebase

//handles sending and receiving chats
class ChatController: ObservableObject {
    
    @Published var messages = [Message]()
    let objectWillChange = PassthroughSubject<ChatController, Never>()
    var senderId = ""
    
    func sendMessage (recipientUsername: String, content: String) {

        let senderAuthId = Auth.auth().currentUser?.uid ?? ""
        findSenderIdFromSenderAuthId(senderAuthId: senderAuthId)

        //retrieve the recipients uid
        userDatabaseRoot.queryOrdered(byChild: "username")
            .queryEqual(toValue: recipientUsername)
            .observeSingleEvent(of: .value, with: {(snapshot) in
                if !snapshot.exists() {
                    print (recipientUsername)
                    print ("Username does not exist")
                }
                else {
                    for child in snapshot.children.allObjects as! [DataSnapshot] {
                        
                        let recipientId = child.key
                        
                        //combine them
                        let messageThreadArray = [
                            self.senderId,
                            recipientId
                        ]
                        
                        //alphabeticalize them
                        let messageThreadArraySorted = messageThreadArray.sorted()
                        
                        //create childId from two sorted uids
                        let messageThreadId = messageThreadArraySorted.first! + "_" + messageThreadArraySorted.last!
                        
                        //create message content
                        let messageToSend = ["senderId": self.senderId,
                                             "recipientId": recipientId,
                                             "content": content,
                                             "senderAuthId": senderAuthId]
                        
                        //create autoId message under new or existing threadId
                        databaseRoot.queryOrdered(byChild: "chats").queryEqual(toValue: messageThreadId)
                            .observeSingleEvent(of: .value, with: {(snapshot) in
                                let newChat = chatDatabaseRoot.child(messageThreadId).childByAutoId()
                                newChat.setValue(messageToSend)
                            }
                        )
                    }
                }
            }
        )
    }
    
    func findSenderIdFromSenderAuthId(senderAuthId: String) {

        userDatabaseRoot.queryOrdered(byChild: "authId")
        .queryEqual(toValue: senderAuthId)
        .observeSingleEvent(of: .value, with: {(snapshot) in
            if !snapshot.exists() {
                print (senderAuthId)
                print ("Auth ID does not exist")
            }
            else {
                for child in snapshot.children.allObjects as! [DataSnapshot] {
                    self.senderId = child.key as String
                }
            }
        })
    }
    
    func receiveMessage(recipientUsername: String) {
        
        let senderAuthId = Auth.auth().currentUser?.uid ?? ""
        findSenderIdFromSenderAuthId(senderAuthId: senderAuthId)
        
        //retrieve the recipient's uid
        userDatabaseRoot.queryOrdered(byChild: "username")
            .queryEqual(toValue: recipientUsername)
            .observeSingleEvent(of: .value, with: {(snapshot) in
                if !snapshot.exists() {
                    print (recipientUsername)
                    print ("Username does not exist")
                }
                else {
                    for child in snapshot.children.allObjects as! [DataSnapshot] {
                        
                        let recipientId = child.key
                        
                        //combine them
                        let messageThreadArray = [
                            self.senderId,
                            recipientId
                        ]
                        
                        //alphabeticalize them
                        let messageThreadArraySorted = messageThreadArray.sorted()
                        
                        //create childId from two sorted uids
                        let messageThreadId = messageThreadArraySorted.first! + "_" + messageThreadArraySorted.last!
                        
                        let query = chatDatabaseRoot.child(messageThreadId).queryLimited(toLast: 100)
                        _ = query.observe(.childAdded, with: { [weak self] snapshot in
                            if let data = snapshot.value as? [String: String],
                                let retrievedSenderId = data["senderId"],
                                let retrievedRecipientId = data["recipientId"],
                                let retrievedContent = data["content"],
                                let retrievedSenderAuthId = data["senderAuthId"],
                                !retrievedContent.isEmpty {
                                let retrievedMessage = Message(content: retrievedContent,
                                                               sender: retrievedSenderId,
                                                               recipient: retrievedRecipientId,
                                                               senderAuthId: retrievedSenderAuthId)
                                self?.messages.append(retrievedMessage)
                                self?.objectWillChange.send(self!)
                            }
                        })
                    }
                }
            }
        )
    }
}





