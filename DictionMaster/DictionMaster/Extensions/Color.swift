//
//  Color.swift
//  DictionMaster
//
//  Created by Grazi  Berti on 05/02/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let backColor = Color("BackColor")
    let buttonColor = Color("ButtonColor")
    let grayColor = Color("GrayColor")
    let textPrimaryColor = Color("TextPrimaryColor")
    let textSecondaryColor = Color("TextSecondaryColor")
    let whiteColor = Color("WhiteColor")
}
