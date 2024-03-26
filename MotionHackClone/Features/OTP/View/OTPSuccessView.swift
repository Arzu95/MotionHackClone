//
//  OTPSuccessView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 24/03/24.
//

import SwiftUI

struct OTPSuccessView: View {
    @State var moveToNextPage: Bool = false
    
    var body: some View {
        VStack {
            LocalImage.success
                .resizable()
                .scaledToFit()
                .frame(width: 111, height: 111)
            Text("OTP Sukses!")
                .fontModifier(type: FontType.bold, size: 24, weight: .bold)
            Text("Anda berhasil login")
                .fontModifier(type: FontType.regular, size: 12, weight: .regular)
        }.onAppear {
            
        }
    }
}

struct OTPSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        OTPSuccessView()
    }
}
