//
//  ChatDatabase.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-14.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation
import Firebase

// Variables denoting database paths
let databaseRoot = Database.database().reference()
let chatDatabaseRoot = databaseRoot.child("chats")
let userDatabaseRoot = databaseRoot.child("users")
