//
//  DataHandler.swift
//  Bop
//
//  Created by Brad Thomas on 2020-10-31.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation
import SwiftUI

class DataHandler: ObservableObject {
    
    var tempArray: [CGFloat] = []
    
    //dataframe containing all queried messages
    //data should be equal to chat controller received messages
    //when data changes, (didSet) calulateValue
    //use if else statement to check for duplicates are add 1 to the value for duplicates
    //when dataWithValue changes, getMaxValue()
    //contacts page needs and add button
    //contacts should be bubbles and so should log in page, but thats a later step
    //i should get a whiteboard to have a todo list for ideas
    //dashboard should be a foreach on the data, receive message should be continuosly updating the data, and messages should be sent and structured
    @Published var data: [Message] = []
    
    //dataframe with calculated value
    @Published var dataWithValue: [MessageBubble] = [MessageBubble(content: "👋", value: 1.0, size: 1.0)] {
        didSet {
            getMaxValue(data: self.dataWithValue)
        }
    }
    
    var maxValue: CGFloat? = 1.0 {
        didSet {
            calculateSize(data: self.dataWithValue)
        }
    }
    
    //when data changes, iterate through the array, creating an array of the values, and change maxValue to the maximum of the values in tempArray
    func getMaxValue (data: [MessageBubble]) {
        for row in data {
            tempArray.append(row.value)
            dataWithSize.append(row)
        }
        //maxValue = tempArray.max()
        //MARK: Dont forget to change this
        maxValue! += 1
    }
    
    @Published var dataWithSize: [MessageBubble] = [MessageBubble(content: "👋", value: 1.0, size: 1.0)]
    
    //when maxValue changes, edit-in-place the size values in the array as size/maxValue
    func calculateSize (data: [MessageBubble]) {
        for index in data.indices {
            dataWithSize[index].size = data[index].size / maxValue!
            print(dataWithSize)
        }
    }
}
