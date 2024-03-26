//
//  OTPSuccessView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 24/03/24.
//

import SwiftUI

struct OTPSuccessView: View {
    @State var moveToNextPage: Bool = false
    
    let vm: OTPViewModel
    
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
            
            NavigationLink(destination: AgreementView(), isActive: $moveToNextPage) {
                EmptyView()
            }
            
        }.onAppear {
            vm.startTimer(duration: 2) { result in
                self.moveToNextPage = result
            }
        }
    }
}

struct OTPSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        OTPSuccessView(vm: OTPViewModel())
    }
}
