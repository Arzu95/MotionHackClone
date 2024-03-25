//
//  AgreementView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 24/03/24.
//

import SwiftUI

struct AgreementView: View {
    @State private var showSheet: Bool = true
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("LocalBlue"), Color.white], startPoint: .center, endPoint: .bottom).ignoresSafeArea()
            ZStack {
                LocalImage.abstract
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 220)
                    .frame(maxHeight: .infinity, alignment: .top)
                //VStack parent
                VStack {
                    //Header
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Hai 👋🏻")
                            .foregroundColor(.white)
                            .fontModifier(type: FontType.semibold, size: 16, weight: .semibold)
                        Text("Sebelum Anda membuat akun, harap baca dan terima Syarat & Ketentuan")
                            .foregroundColor(.white)
                            .fontModifier(type: FontType.medium, size: 14, weight: .medium)
                    }.padding(.top, 70)
                    Spacer()
                    //Syarat & ketentuan
                    RoundedRectangle(cornerRadius: 17)
                        .padding(.top)
                        .ignoresSafeArea(.all)
                        .foregroundColor(.white)
                        .overlay {
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Syarat & Ketentuan")
                                        .fontModifier(type: FontType.medium,
                                                      size: 24, weight: .medium)
                                    HStack {
                                        LocalImage.clock
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color("LocalBlue"))
                                        Text("Update terakhir: 1 Januari 2024")
                                            .fontModifier(type: FontType.regular,
                                                          size: 11, weight: .regular)
                                            .foregroundColor(Color("LocalBlue"))
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(TextData.agreementTextHeader)
                                            .fontModifier(type: FontType.regular, size: 11, weight: .regular)
                                            .padding(.vertical)
                                        Text("ColabCal")
                                            .fontModifier(type: FontType.medium, size: 12, weight: .medium)
                                            
                                        Text(TextData.agreementText)
                                            .fontModifier(type: FontType.regular, size: 11, weight: .regular)
                                            .multilineTextAlignment(.leading)
                                            
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            }
                            .padding(20)
                            .padding(.top, 20)
                        }
                    //button agree
                    .overlay {
                        ZStack() {
                            Rectangle()
                                .frame(height: 120)
                                .foregroundColor(Color.white.opacity(0.5))
                            HStack(spacing: 25) {
                                Button {
                                   // do something..
                                } label: {
                                    Text("Batal")
                                        .fontModifier(type: FontType.medium,
                                                      size: 12, weight: .medium)
                                        .foregroundColor(Color("LocalBlue"))
                                        .frame(width: 128, height: 30)
                                        .background(Color("Color-LightBlue"))
                                        .cornerRadius(20)
                                        
                                }
                                Button {
                                   // do something..
                                } label: {
                                    Text("Terima")
                                        .fontModifier(type: FontType.medium,
                                                      size: 12, weight: .medium)
                                        .foregroundColor(.white)
                                        .frame(width: 128, height: 30)
                                        .background(Color("LocalBlue"))
                                        .cornerRadius(20)
                                        
                                }

                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    }
                        
                }
                
            }
            
        }
        //sheet?
//        .sheet(isPresented: $showSheet, onDismiss: {
//            showSheet = true
//        }) {
//            AgreementSheet()
//                .presentationDetents([.fraction(0.79)])
//        }
    }
}

struct AgreementView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementView()
    }
}

//MARK: Sheet View
//struct AgreementSheet: View {
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            VStack(alignment: .leading, spacing: 10) {
//                Text("Syarat & Ketentuan")
//                    .fontModifier(type: FontType.medium,
//                                  size: 24, weight: .medium)
//                HStack {
//                    LocalImage.clock
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 16, height: 16)
//                        .foregroundColor(Color("LocalBlue"))
//                    Text("Update terakhir: 1 Januari 2024")
//                        .fontModifier(type: FontType.regular,
//                                      size: 11, weight: .regular)
//                        .foregroundColor(Color("LocalBlue"))
//                }
//
//                VStack(alignment: .leading) {
//                    Text(TextData.agreementTextHeader)
//                        .fontModifier(type: FontType.regular, size: 11, weight: .regular)
//                        .padding(.vertical)
//                    Text("ColabCal")
//                        .fontModifier(type: FontType.medium, size: 12, weight: .medium)
//                        .padding(.bottom, 1)
//                    Text(TextData.agreementText)
//                        .fontModifier(type: FontType.regular, size: 11, weight: .regular)
//                        .multilineTextAlignment(.leading)
//
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .multilineTextAlignment(.leading)
//        }.padding(20)
//    }
//}
//
