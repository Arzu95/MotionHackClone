//
//  OTPView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 24/03/24.
//

import SwiftUI

struct OTPView: View {
    @StateObject private var vm = OTPViewModel()
    @FocusState var fieldFocus: Int?
    @State var showAlert: Bool = false
    @State var isActive: Bool = false
    var body: some View {
        // parent stack
        
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    // Header
                    header()
                    //OTP TextField
                    OTPTextField()
                        .padding(30)
                    
                    //kirim ulang kode OTP
                    ResendCode()
                }
                Spacer()
                
                NavigationLink(destination: OTPSuccessView(vm: OTPViewModel()),
                               isActive: $isActive) {
                    EmptyView()
                }
                // send code verification
                verifyButton()
            }
            .alert("Pastikan kode telah terisi dengan benar", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}



extension OTPView {
    
    @ViewBuilder
    func OTPTextField() -> some View {
        HStack {
            ForEach(0..<vm.numberOfFields, id: \.self) { index in
                TextField("", text: $vm.enterValue[index], onEditingChanged:
                            { editing in
                    if editing {
                        vm.oldValue = vm.enterValue[index]
                    }})
                .keyboardType(.numberPad)
                .frame(width: 50, height: 60)
                .background(Color(.darkGray).opacity(0.1))
                .cornerRadius(5)
                .multilineTextAlignment(.center)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: vm.enterValue[index]) { newValue in
                    if vm.enterValue[index].count > 1 {
                        let currentValue = Array(vm.enterValue[index])
                        
                        if currentValue[0] == Character(vm.oldValue) {
                            vm.enterValue[index] = String(vm.enterValue[index].suffix(1))
                        } else {
                            vm.enterValue[index] = String(vm.enterValue[index].prefix(1))
                        }
                    }
                    
                    if !newValue.isEmpty {
                        if index == vm.numberOfFields - 1 {
                            fieldFocus = nil
                        } else {
                            fieldFocus = (fieldFocus ?? 0) + 1
                        }
                    } else {
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                }
            }
        }
    }
    
    struct header: View {
        var body: some View {
            VStack(spacing: 5) {
                Text("Verifikasi Kode OTP")
                    .fontModifier(type: FontType.bold,size: 27, weight: .bold)
                    .padding()
                    .foregroundColor(Color("LocalBlue"))
                Text("Kode OTP telah dikirim ke ")
                    .fontModifier(type: FontType.medium, size: 12, weight: .medium)
                Text("+62 xx xxxx xxxx")
                    .fontModifier(type: FontType.medium, size: 12, weight: .medium)
            }
        }
    }
    
    @ViewBuilder
    func verifyButton() -> some View {
        Button {
            verify()
        } label: {
            Text("Verify")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("LocalBlue"))
                .cornerRadius(10)
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func ResendCode() -> some View {
        VStack(spacing: 10) {
            HStack(spacing:5) {
                Text("Kirim ulang dalam")
                    .fontModifier(type: FontType.regular,size: 12, weight: .regular)
                Text("59 detik")
                    .fontModifier(type: FontType.medium,size: 12, weight: .medium)
            }
            HStack(spacing: 5) {
                Text("Kode belum masuk?")
                    .fontModifier(type: FontType.regular, size: 12, weight: .regular)
                    .foregroundColor(Color(.gray))
                Button {
                    // send code..
                } label: {
                    Text("Kirim Ulang")
                        .fontModifier(type: FontType.medium, size: 12, weight: .medium)
                        .foregroundColor(Color("LocalBlue"))
                }
                
            }
        }
    }
    
    func verify(){
        if vm.enterValue.allSatisfy({ !$0.isEmpty }) {
            self.isActive = true
        } else {
            self.showAlert = true
            self.isActive = false
        }
    }
    
}
