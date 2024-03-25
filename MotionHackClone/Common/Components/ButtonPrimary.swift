//
//  ButtonPrimary.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI

struct ButtonPrimary: View {
    
    var title : String
    var action : () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .foregroundColor(.white)
                .background(LocalColor.blue)
                .cornerRadius(12)
                .padding(.top, 40)
        })
    }
}
