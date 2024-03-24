//
//  SignUpView.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                TextFormView { validate in
                    VStack {
                        UnderlineTextField(text: $viewModel.fieldNama, title: "Nama")
                            .padding(.top)
                        UnderlineTextField(text: $viewModel.fieldEmail, title: "Email")
                            .padding(.top)
                        UnderlineSecureField(text: $viewModel.fieldPasssword, title: "Kata Sandi", isVisible: viewModel.isVisiblePassword, action: {
                            viewModel.isVisiblePassword.toggle()
                        })
                        .padding(.top)
                        UnderlineSecureField(text: $viewModel.fieldConfirmPassword, title: "Konfirmasi Kata Sandi", isVisible: viewModel.isVisibleConfirm, action: {
                            viewModel.isVisibleConfirm.toggle()
                        })
                        .padding(.top)
                    }
                }
                ButtonPrimary(title: "Daftar", action: {})
                    .padding(.bottom, 48)
                Image.or_with
                HStack(spacing: 17){
                    Button {
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 128, height: 57)
                                .foregroundColor(.white)
                                .shadow(radius: 4, x: 0, y: 4)
                            HStack{
                                Image("icon-google")
                                Text("Google")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 128, height: 57)
                                .foregroundColor(.white)
                                .shadow(radius: 4, x: 0, y: 4)
                            HStack{
                                Image("icon-facebook")
                                Text("Facebook")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }
                .padding(.top, 29)
                
                HStack{
                    Text("Belum memiliki akun?")
                        .fontWeight(.regular)
                        .font(.system(size: 14))
                    Text("Daftar")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(LocalColor.blue)
                }
                .padding(.top, 37)
            }
            .padding(.horizontal, 30)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
