//
//  ViewFunctions.swift
//  Bop
//
//  Created by Brad Thomas on 2020-06-11.
//  Copyright © 2020 Brad Thomas. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Global Variables
enum Constants {
    static let frameWidth:CGFloat = 230
    static let notificationWidth:CGFloat = 300
    static let notificationHeight:CGFloat = 40
    static let verticalPadding:CGFloat = 60
}

// MARK: Text Field Underline
func textFieldLine (width: CGFloat) -> some View {
    let LineWidth = width
    return Rectangle ()
        .frame(width: LineWidth, height: 1)
        .foregroundColor(Color.orange)
}

// MARK: Text Field with labels
func textFieldLabeled (width: CGFloat, description: String) -> some View {
    VStack {
        textFieldLine(width: width)
        HStack {
            Text(description)
                .font(.footnote)
                .fontWeight(.thin)
                .foregroundColor(Color.white)
                .frame(width:width, alignment: .topLeading)
                .padding ([.leading, .bottom])
        }
    }
    
}

// MARK: Color Manager
struct ColorManager {
    static let backgroundTopLeft = Color("backgroundTopLeft")
    static let backgroundBottomRight = Color("backgroundBottomRight")
    static let button = Color("button")
    static let backgroundGradientColors = Gradient(colors: [ColorManager.backgroundTopLeft, ColorManager.backgroundBottomRight])
    static let lightGrey = Color("lightGrey")
}

// MARK: Background

struct Background: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: ColorManager.backgroundGradientColors, startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
    }
}
