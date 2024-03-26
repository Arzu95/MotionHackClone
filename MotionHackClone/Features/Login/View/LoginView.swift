//
//  LoginView.swift
//  MotionHackClone
//
//  Created by Muhammad Arzu on 24/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 3){
                    Text("Selamat Datang 👋🏻")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Text("AAA")
                        .fontWeight(.regular)
                        .font(.system(size: 14))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 57)
                
                UnderlineTextField(text: $viewModel.email, title: "Email")
                    .textInputAutocapitalization(.never)
                UnderlineSecureField(
                    text: $viewModel.password,
                    title: "Kata Sandi",
                    isVisible: viewModel.isHiddenPassword,
                    action: {viewModel.isHiddenPassword.toggle()})
                
                VStack(alignment: .trailing){
                    Button {
                        
                    } label: {
                        Text("Lupa Kata Sandi?")
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                            .padding(.top, 12)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                
                Button {
                    viewModel.signIn()
                } label: {
                    ZStack{
                        Text("Masuk")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .frame(width: 329, height: 45.4)
                            .background(.blue)
                            .cornerRadius(12)
                    }
                }
                .padding(.top, 45.3)
                .padding(.leading)
                
                
                HStack(spacing: 16){
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(LocalColor.grayy)
                    Text("atau daftar dengan")
                        .fontWeight(.regular)
                        .font(.system(size: 11))
                        .foregroundColor(LocalColor.grayy)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(LocalColor.grayy)
                }
                .padding(.top, 70)
                
                HStack(spacing: 17){
                    Button {
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 128, height: 57)
                                .foregroundColor(.white)
                                .shadow(radius: 2, x: 0, y: 2)
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
                                .shadow(radius: 2, x: 0, y: 2)
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
                    NavigationLink(destination: SignUpView(), label: {
                        Text("Daftar")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(LocalColor.bluee)
                    })
                }
                .padding(.top, 37)
                Image.logo
                    .padding(.top, 18)
            }
            .padding(15)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
