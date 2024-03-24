//
//  UnderlineSecureField.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI

struct UnderlineSecureField: View {
    
    @Binding var text: String
    var title: String
    var isVisible: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color.black.opacity(0.55))
                .font(.system(size: 14))
            HStack {
                TextField("", text: $text)
                Button(action: action, label: {
                    Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(Color.black.opacity(0.55))
                })
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(LocalColor.blue)
        }
    }
}

