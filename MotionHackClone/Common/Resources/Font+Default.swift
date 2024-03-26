//
//  Font+Default.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 24/03/24.
//

import SwiftUI

enum FontType {
    static let medium: String = "Poppins-Medium"
    static let bold: String = "Poppins-Bold"
    static let regular: String = "Poppins-Regular"
    static let semibold = "Poppins-SemiBold"
}

extension Text {
    func fontModifier(type: String, size: CGFloat, weight: Font.Weight) -> some View {
        self
            .font(Font.custom(type, size: size))
            .fontWeight(weight)
    }
}
