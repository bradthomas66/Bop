//
//  SelectionChange.swift
//  Bop
//
//  Created by Brad Thomas on 2020-07-21.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

// Converts Date types to String types
class SelectionChange: ObservableObject {

//    TODO: birthdayString is not changing in the function
    @State private var birthdayString = "07 22 2020"
    
    var birthday: Date = Date() {
        didSet {
            formatDate(selectedDate: birthday)
        }
    }
    
    func formatDate (selectedDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd yyyy"
        birthdayString = formatter.string(from: selectedDate)
    }
}


