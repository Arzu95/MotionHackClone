//
//  SignUpView.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI
import GoogleSignInSwift

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack {
                    UnderlineTextField(text: $viewModel.fieldNama, title: "Nama")
                        .padding(.top)
                    UnderlineTextField(text: $viewModel.fieldEmail, title: "Email")
                        .padding(.top)
                        .textInputAutocapitalization(.never)
                    UnderlineSecureField(text: $viewModel.fieldPasssword, title: "Kata Sandi", isVisible: viewModel.isVisiblePassword, action: {viewModel.isVisiblePassword.toggle()})
                    UnderlineSecureField(text: $viewModel.fieldConfirmPassword, title: "Konfirmasi Kata Sandi", isVisible: viewModel.isVisibleConfirm, action: {viewModel.isVisibleConfirm.toggle()})
                    .padding(.top)
                }
                
                ButtonPrimary(title: "Daftar", action: {
                    viewModel.signUp()
                })
                .padding(.bottom, 48)
                Image.or_with
                HStack(spacing: 17){
                    Button {
                        Task {
                            do {
                                try await viewModel.googleSignIn()
                            } catch let e {
                                print(e.localizedDescription)
                            }
                        }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack(alignment: .leading) {
                        Text("Daftarkan diri,")
                            .font(.system(size: 22))
                            .bold()
                        Text("Masukan data diri kamu")
                            .font(.system(size: 14))
                            .foregroundColor(Color.black.opacity(0.55))
                    }
                    .padding()
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
