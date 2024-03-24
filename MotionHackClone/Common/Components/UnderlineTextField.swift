//
//  UnderlineTextField.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI

struct UnderlineTextField: View {
    @Binding var text: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color.black.opacity(0.55))
                .font(.system(size: 14))
            TextField("", text: $text)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(LocalColor.blue)
        }
    }
}
