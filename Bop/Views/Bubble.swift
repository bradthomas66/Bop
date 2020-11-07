//
//  Bubble.swift
//  Bop
//
//  Created by Brad Thomas on 2020-10-31.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import SwiftUI

struct Bubble: View {
    var content: String
    var number: CGFloat
    var size: CGFloat
    
    init (content: String, number: CGFloat, size: CGFloat) {
        self.content = content
        self.number = number
        self.size = size
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.white)
                .frame(width: 50+(size*UIScreen.width*0.8), height: 50+(size*UIScreen.height*0.8))
            .shadow(color: Color.white, radius: 5)
            Text(content)
                .font(.system(size: 25+(size*UIScreen.width*0.65)))
                .offset(y: -6-(size*UIScreen.width*0.08))
            Text(String(format: "%.0f", Double(number)))
                .font(.system(size: 15+(size*UIScreen.width*0.1)))
                .foregroundColor(.white)
                .offset(y: 15+(size*UIScreen.width*0.3))
        }
    }
}

struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        Bubble(content: "🥵", number: 40.0, size: 0.75)
    }
}
